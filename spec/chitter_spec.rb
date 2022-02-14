require 'chitter'

describe '.all' do
  it 'returns the messages of peeps' do
    message = ChitterMessage.all

    expect(message.find { |item| item["msg"] == "This is an emergency!" && item["dt"] == "2022-02-13"}).to_not be_nil
  end
end