require 'messages'

describe Messages do
  
  describe '#all' do 
    it 'returns all the messages' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!')")
      messages = Messages.all
      expect(messages).to eq ['This is a peep!']
    end
  end

  describe '#create' do 
    it 'saves the post into database' do
      connection = PG.connect(dbname: 'chitter_test')
      Messages.create('This is a peep!')
      messages = Messages.all
      expect(messages).to eq ['This is a peep!']
    end
  end
end
