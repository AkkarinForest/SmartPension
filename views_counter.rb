class ViewsCounter
  def call(views_logs)
    views_logs.map(&:first).tally
  end
end
