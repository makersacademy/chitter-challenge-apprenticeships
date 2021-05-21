require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      PG.connect(dbname: 'chitter_test')

      Peep.create(message: 'Oh, hi doggy', date: "2021-05-19")
      Peep.create(message: 'Cheep cheep cheep cheep', date: "2021-03-20")
      Peep.create(message: 'Anything for my princess', date: "2021-05-15")

      peeps = Peep.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(peeps.first.message).to eq 'Oh, hi doggy'
      expect(peeps.first.date).to eq '2021-05-19'
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      peep = Peep.create(message: 'test', date: '2021-05-21').first

      expect(peep['message']).to eq 'test'
      expect(peep['date']).to eq '2021-05-21'
    end
  end

  describe '.find' do
    it 'finds a peep with a keyword' do
      PG.connect(dbname: 'chitter_test')

      Peep.create(message: 'Oh, hi doggy', date: "2021-05-19")
      Peep.create(message: 'Cheep cheep cheep cheep', date: "2021-03-20")
      Peep.create(message: 'Anything for my princess', date: "2021-05-15")
      Peep.create(message: 'good doggy', date: "2021-03-20")

      filteredpeeps = Peep.find('doggy')
  
      expect(filteredpeeps[0].message).to eq "Oh, hi doggy"
      expect(filteredpeeps[1].message).to eq "good doggy"
      expect(filteredpeeps[2]).to eq nil
    end
  end
end