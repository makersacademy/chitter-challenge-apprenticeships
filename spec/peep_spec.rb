require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of all the peeps' do
      PG.connect(dbname: 'chitter_test')

      Peep.create(message: 'This is a peep!', date: "2021-01-04")

      peeps = Peep.all

      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'This is a peep!'
      expect(peeps.first.date).to eq "2021-01-04"
    end

    it 'returns the list in reverse chronoological order' do
      PG.connect(dbname: 'chitter_test')

      Peep.create(message: 'This is a peep!', date: '2021-01-04')
      Peep.create(message: 'This is another peep!', date: '2021-02-04')
      Peep.create(message: 'This is the third peep!', date: '2021-03-04')
      Peep.create(message: 'I like cheese!', date: '2021-04-04')

      peeps = Peep.all

      expect(peeps.first.message).to eq 'I like cheese!'
      expect(peeps.last.message).to eq 'This is a peep!'

    end

  end

  describe '.create' do
    it 'adds a new peep to the db' do
      new_peep = Peep.create(message: 'This is a new peep!', date: "2021-01-04")

      expect(new_peep).to be_a Peep
      expect(new_peep.message).to eq 'This is a new peep!'
      expect(new_peep.date).to eq "2021-01-04"
    end
  end
end 
