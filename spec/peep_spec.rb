require 'peep'

describe Peep do
  subject { Peep }

  describe '.add' do
    it 'adds a peep to the database' do
      test_peep = Peep.add(username: 'test user', message: 'test message')

      expect(test_peep).to be_a Peep
      expect(test_peep.username).to eq 'test user'
      expect(test_peep.message).to eq 'test message'
    end
  end
end
