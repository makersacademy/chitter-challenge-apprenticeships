describe Peep do
  let(:peep) { Peep.new('3', 'Hello!', '2021-06-24') }

  describe '#all' do
    it 'returns all peeps' do
      add_rows_to_test_database
      peeps = Peep.all()
      expect(peeps.first.message).to eq 'This is a peep!' 
      expect(peeps.last.message).to eq 'This is another peep!' 
    end

    it 'returns peeps filtered on a specific keyword' do
      add_rows_to_test_database
      peeps = Peep.all('another')
      expect(peeps.first.message).to eq 'This is another peep!' 
      expect(peeps.length).to eq 1 
    end
  end

  describe '#create' do
    it 'adds peep to db' do
      Peep.create('A great peep indeed!', '20210621')
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("SELECT * FROM peeps WHERE message = 'A great peep indeed!';")
      expect(result.first['message']).to eq 'A great peep indeed!' 
      expect(result.first['date']).to eq '2021-06-21' 
    end
  end

  describe '#message' do
    it 'returns a Peep\'s message' do
      expect(peep.message).to eq 'Hello!'
    end
  end

  describe '#date' do
    it 'returns a Peep\'s date' do
      expect(peep.date).to eq '2021-06-24'
    end
  end
end
