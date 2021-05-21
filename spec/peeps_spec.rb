require 'peeps'
require 'database_helpers'

describe Peep do
  # As a Maker
  # So that I can see what people are doing
  # I want to see all the messages (peeps)
  # in a browser
  describe '.all' do
    it 'returns all posts/peeps' do
      peep = Peep.create(message: 'This is a peep!')
      Peep.create(message: 'My first peep!')

      peeps = Peep.all

      expect(peeps.length).to eq 2
      expect(peeps.first).to be_a Peep
      expect(peeps.last.id).to eq peep.id
      expect(peeps.last.message).to eq 'This is a peep!'
      expect(peeps.first.date).to eq peep.date
    end
  end

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  describe '.create' do
    it 'creates a new post/peep' do
      peep = Peep.create(message: 'My first peep!')
      persisted_data = persisted_data(id: peep.id)

      expect(peep).to be_a Peep
      expect(peep.id).to eq persisted_data['id']
      expect(peep.message).to eq 'My first peep!'
    end
  end
end
