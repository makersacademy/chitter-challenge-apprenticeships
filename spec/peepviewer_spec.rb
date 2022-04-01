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
      expect(result.first.message).to eq 'This is a peep!'
      expect(result.length).to eq 2
    end
  end

  context '.add' do
    it 'allows the user to add a peep to the list' do
      result = PeepViewer.add(message: 'new peep!')
      expect(result.message).to include 'new peep!'
    end

    it 'displays the date of creation next to the peep' do
      result = PeepViewer.add(message: 'new peep!')
      todays_date = Date.today.to_s
      expect(result.date).to include todays_date
    end
  end
end