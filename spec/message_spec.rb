require 'messages'

describe Messages do
  describe '.all' do
    it 'shows all messages' do
      messages = Messages.all

      expect(messages).to include("This is a peep!")
      expect(messages).to include("and another peep")
    end
  end
end
