require 'peep'
require '/Users/ok/Projects/individual-challenges/chitter-challenge-apprenticeships/helpers/db_helpers.rb'

RSpec.describe Peep do
  describe '#all' do
    it 'returns a list of all peeps' do
      expect(Peep.all).to eq [
        { message: 'I just bought a cabbage', time: '15:37' },
        { message: 'Eggs are so weird am I right?', time: '15:37' }
      ]
    end
  end
  describe '#post' do
    it 'inserts the post into the database' do
      peep = Peep.post(message: 'My name is Ollie')
      persisted_data = persisted_data(id: peep[0][:id])
      expect(persisted_data['message']).to eq 'My name is Ollie'
    end
  end
end
