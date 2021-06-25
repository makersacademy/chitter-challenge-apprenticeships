require 'peep.rb'

describe Peep do
  describe '.all' do
    it 'will display all the peeps in the database' do
      connection = PG.connect(dbname: 'chitter_test')
      Peep.create(peep: 'Donald Trump looks like a wotsit.')
      Peep.create(peep: 'I am making lasagne for dinner tonight..')
      Peep.create(peep: 'Why do we have eyelids?')

      peeps = Peep.all

      expect(peeps).to include('Donald Trump looks like a wotsit.')
      expect(peeps).to include('I am making lasagne for dinner tonight..')
      expect(peeps).to include('Why do we have eyelids?')
    end
  end
  describe '.create' do
    it 'will add a peep to the database' do
      Peep.create(peep: 'Why are a sequence of numbers referred to as pie?')
      expect(Peep.all).to include('Why are a sequence of numbers referred to as pie?')
    end
  end
end
