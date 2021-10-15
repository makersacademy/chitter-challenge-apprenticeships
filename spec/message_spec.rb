require 'message'

describe 'Message' do
  describe'.all' do
    it 'stores the messages' do
      messages = Message.all 
      expect(messages).to include "Today's first peep"
      expect(messages).to include "Today's second peep"
      expect(messages).to include "Today's third peep"
    end
  end
end