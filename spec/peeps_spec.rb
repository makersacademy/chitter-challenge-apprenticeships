require 'peeps'

describe Peep do
  # As a Maker
  # So that I can see what people are doing
  # I want to see all the messages (peeps)
  # in a browser
  describe '.all' do
    it 'returns all posts/peeps' do
      setup_test_database
      add_row_to_test_database
      
      peeps = Peep.all

      expect(peeps).to include("This is a peep!")
    end
  end

  # As a Maker
  # So that I can let people know what I am doing
  # I want to post a message (peep) to chitter
  describe '.create' do
  it 'creates a new post/peep' do
    Peep.create(message: 'My first peep!')

    expect(Peep.all).to include("My first peep!")
    end
  end
end
