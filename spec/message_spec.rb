
require 'message'

RSpec.describe '.all' do
  context "so that I can see what people are doing" do
    it "#all displays all messages" do
      messages = Message.all
      expect(messages).to include "This is a peep!"
    end
  end
end
