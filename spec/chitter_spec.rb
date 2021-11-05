require 'message'

describe Message do 

  describe '#all' do
    it 'returns all peeps' do 
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
      
      messages = Message.all

      expect(messages).to eq (['This is a peep!'])
    end
  end

  describe '#add' do 
    it 'adds a new message to the db' do
      connection = PG.connect(dbname: 'chitter_test')

      Message.add('peeppeeppeep')

      expect(Message.all).to include 'peeppeeppeep'
    end
  end
end
