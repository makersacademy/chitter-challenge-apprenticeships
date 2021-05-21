require 'peep'
require 'database_helpers'

describe Peep do



  describe '.all' do
    it 'returns a list of peeps' do
      peep = Peep.create(message: 'This is a peep!')
      Peep.create(message: 'this is my first peep!')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.message).to eq 'This is a peep!'
      expect(peeps.first.posted_on).to eq peep.posted_on
    end
  end

  describe '.create' do
    it 'posts a new peep' do
      peep = Peep.create(message: 'this is my first peep!')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'this is my first peep!'

    end
  end

  describe '.find' do
    it 'searches for a peep by a specific keyword ' do
      Peep.create(message: 'this is my first peep!')
      Peep.create(message: 'this is my second peep!')
      peep = Peep.find('first').to_s
      expect(peep).not_to include 'this is my second peep!'
      expect(peep).to include 'this is my first peep!'
    end
  end
end
