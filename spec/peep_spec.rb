describe Peep do
  let(:peep) { Peep.new('3', 'Hello!', '2021-06-24') }

  describe '#all' do
    it 'returns all peeps' do
      add_rows_to_test_database
      peeps = Peep.all
      expect(peeps.first.message).to eq 'This is a peep!' 
      expect(peeps.last.message).to eq 'This is another peep!' 
    end
  end

  describe '#filtered' do
    it 'returns peeps filtered on a specific keyword' do
      add_rows_to_test_database
      peeps = Peep.filtered('another')
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

  describe '#delete' do
    it 'deletes a peep from db' do
      connection = PG.connect(dbname: 'chitter_test')
      result = connection.exec("INSERT INTO peeps (message, date) VALUES('A great peep indeed!', '20210621') RETURNING id, message, date;")
      Peep.delete(result.first['id'])
      result = connection.exec("SELECT * FROM peeps WHERE message = 'A great peep indeed!';")
      expect(result.ntuples).to eq 0
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

  describe '#id' do
    it 'returns a Peep\'s id' do
      expect(peep.id).to eq '3'
    end
  end
end
