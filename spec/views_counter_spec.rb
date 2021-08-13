require './views_counter.rb'

RSpec.describe ViewsCounter do
  let(:views_logs) {[
      ["/help_page/1", "126.318.035.038"],
      ["/help_page/1", "126.318.035.038"],
      ["/contact", "184.123.665.067"],
      ["/help_page/1", "929.398.951.889"],
    ]}

  it 'counts total pages views' do
    result = subject.call(views_logs)

    expect(result.total).to eq({
      "/help_page/1" => 3,
      "/contact" => 1,
    })
  end

  it 'counts unique pages views' do
    result = subject.call(views_logs)

    expect(result.unique).to eq({
      "/help_page/1" => 2,
      "/contact" => 1,
    })
  end
end
