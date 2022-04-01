require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # connection.exec("INSERT INTO peeps (message) VALUES('Hey, Welcome to my chitter page');")
      Peeps.create(message: "Hey, Welcome to my chitter page")
      peeps = Peeps.all

      expect(peeps[0]).to be_a Peeps
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peeps.create(message: 'Today was a great day')

      expect(peep).to be_a Peeps
      expect(peep.message).to eq 'Today was a great day'
      expect(DateTime.parse(peep.date)).to be_an_instance_of(DateTime)
    end
  end
end
