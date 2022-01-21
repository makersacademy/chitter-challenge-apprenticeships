require 'peep'
require_relative 'setup_test_database'

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

  describe '.search' do
    it { is_expected.to respond_to(:search).with(1).argument }

    it 'returns peeps with the designated keyword' do
      setup_test_database

      Peep.add(username: 'test user one', message: 'test message one')
      Peep.add(username: 'test user two', message: 'test message two')
      Peep.add(username: 'test user three', message: 'test message three')
      Peep.add(username: 'red herring user one', message: 'red herring message one')
      Peep.add(username: 'red herring user two', message: 'red herring message two')

      search = Peep.search('test')

      expect(search.length).to eq 3
      expect(search.first.username).to include 'test user'
      expect(search.first.message).to include 'test message'
      expect(search.last.username).to include 'test user'
      expect(search.last.message).to include 'test message'
      expect(search.first.username).not_to include 'red herring'
      expect(search.first.message).not_to include 'red herring'
      expect(search.last.username).not_to include 'red herring'
      expect(search.last.message).not_to include 'red herring'
    end
  end
end
