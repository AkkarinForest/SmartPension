require './logs_decoder.rb'

RSpec.describe LogsDecoder do
  let(:file) { "/help_page/1 126.318.035.038\n/contact 184.123.665.067\n/help_page/1 929.398.951.889" }

  it 'splits log files into array' do
    result = subject.call(file)

    expect(result).to eq([
      ["/help_page/1", "126.318.035.038"],
      ["/contact", "184.123.665.067"],
      ["/help_page/1", "929.398.951.889"],
    ])
  end
end
