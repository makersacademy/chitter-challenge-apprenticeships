require 'pg'

describe Message do 
  describe '.all' do 
    it 'returns all messages' do 
   
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")   
      connection.exec("INSERT INTO peeps (message) VALUES('Adding test data within the tests');")   
      connection.exec("INSERT INTO peeps (message) VALUES('Saved as variable to instantiated Message class');")   
      
      peeps = Message.all

      expect(peeps[0].message).to eq('This is a peep!')
      expect(peeps[1].message).to eq('Adding test data within the tests')
      expect(peeps[2].message).to eq('Saved as variable to instantiated Message class')
    end 
  end 
end 