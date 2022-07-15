
require 'message'

RSpec.describe Message do
  context "so that I can see what people are doing" do
    it "#all displays all messages" do
      message1 = Message.new
      message1.add("First message")
      message1.add("Second message")
      expect(message1.all).to eq ["First message", "Second message"]
    end
  end
end
