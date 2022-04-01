require 'peepviewer'
require_relative 'setup_test_database'

RSpec.describe PeepViewer do
  it 'returns nothing if the database is empty' do  #chitter_test test database is empty by default
    result = PeepViewer.all
    expect(result).to eq []
  end
  context '.all' do
    it 'returns a list of peep messages from the db' do
      add_row_to_test_database
      add_row_to_test_database

      result = PeepViewer.all
      expect(result).to eq ['This is a peep!', 'This is a peep!']
    end
  end

  context '.add' do
    it 'allows the user to add a peep to the list' do
      PeepViewer.add(message: 'new peep!')
      result = PeepViewer.all
      expect(result).to include 'new peep!'
    end
  end
end