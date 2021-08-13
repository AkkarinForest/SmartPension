require './views_data_presenter.rb'

RSpec.describe ViewsDataPresenter do
  let(:views_data) {{
    all: { "/help_page/1" => 101, "/contact" => 3 },
    unique: { "/help_page/1" => 11, "/contact" => 2 }
  }}
  let(:subject) { described_class.new(views_data) }

  it 'prepares views for display' do
    result = subject.display.first

    expect(result).to eq("/help_page/1   101 visits")
  end

  it 'prepares unique views for display' do
    result = subject.display.last

    expect(result).to eq("/contact         2 unique visits")
  end

  it 'sorts views correctly' do
    result = subject.display

    expect(result[0, 2]).to eq([
      "/help_page/1   101 visits",
      "/contact         3 visits",
    ])
  end

  it 'prepares data for display' do
    result = subject.display

    expect(result).to eq([
      "/help_page/1   101 visits",
      "/contact         3 visits",
      "",
      "--------------------------------",
      "",
      "/help_page/1    11 unique visits",
      "/contact         2 unique visits",
    ])
  end
end
