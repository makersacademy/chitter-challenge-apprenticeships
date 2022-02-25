require 'pg'
require 'peeps'

describe Peep do

  describe '#all' do
    it 'lists all the peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      peep1 = Peep.create(message: 'This is my first peep!')
      peep2 = Peep.create(message: 'This is my second peep!')
      peep3 = Peep.create(message: 'This is my third peep!')

      peeps_list = Peep.all

      expect(peep1.message).to include "This is my first peep!"
      expect(peep2.message).to include "This is my second peep!"
      expect(peep3.message).to include "This is my third peep!"

    end
  end

  describe '#create' do
    it 'creates a new peep' do
      connection = PG.connect(dbname: 'chitter_test')

      new_peep = Peep.create(message: 'Here is a new peep')
      peeps_list = Peep.all

      expect(new_peep).to be_a Peep
      expect(new_peep.message).to include "Here is a new peep"
    end
  end
  
end