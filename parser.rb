#!/usr/bin/env ruby

require './logs_decoder.rb'
require './views_counter.rb'
require './views_data_presenter.rb'

class Parser
  def initialize(logs_decoder: LogsDecoder.new, views_counter: ViewsCounter.new)
    @logs_decoder = logs_decoder
    @views_counter = views_counter
  end

  def call(input)
    views_log = logs_decoder.call(input)
    views_count = views_counter.call(views_log)

    ViewsDataPresenter.new(views_count).all_data
  end

  private

  attr_reader :logs_decoder, :views_counter
end

file = ARGF.read

puts Parser.new.call(file)
