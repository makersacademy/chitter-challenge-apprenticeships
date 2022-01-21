RSpec.describe Message do

  describe '.all' do
    it 'returns messages in reverse chronological order' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) values ('This is the first peep!');")
      connection.exec("INSERT INTO peeps (message) values ('This is the second peep!');")

      result = Message.all
      first_entry = result.first
      second_entry = result.last
      
      expect(second_entry.id).to be < first_entry.id
      expect(first_entry.message).to eq('This is the second peep!')
      expect(second_entry.message).to eq('This is the first peep!')
    end
  end

end
