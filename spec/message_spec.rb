require 'message'

describe Message do

  describe '.all' do

    it 'can add a peep to database' do
      Message.peep(message: 'This is a peep')

      #----
      # p Message.all
      #----
      expect(Message.all.length).to eq 1
      expect(Message.all.first.message).to eq 'This is a peep'
    end
  end

  describe '.peeps' do
    it 'can create a new entry' do
      
    end
  end

  describe '.date' do
    it 'can get the current time' do
      time = Message.date
      expect(Message.date).to eq time
    end
  end

end
