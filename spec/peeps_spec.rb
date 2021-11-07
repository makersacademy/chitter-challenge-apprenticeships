require 'pg'
require 'peeps'
require 'spec_helper'
require 'peep_support'

describe 'Peeps_viewing' do

  it 'Class returns all peeps' do
    conn = PG.connect(dbname: 'chitter_test')
    add_row_to_test_database
    my_peeps = Peeps.all
    my_peep = my_peeps.last 
    expect(my_peep[:message]).to include 'This is a peep!'
  end

  it 'Class adds a new peep' do
    conn = PG.connect(dbname: 'chitter_test')
    Peeps.add(peep_text: "Class test peep")
    my_peeps = Peeps.all
    my_peep=my_peeps.last 
    expect(my_peep[:message]).to include "Class test peep"
  end

  it 'Class adds date to a new peep' do
    conn = PG.connect(dbname: 'chitter_test')
    Peeps.add(peep_text: "Class test peep")
    my_peeps = Peeps.all
    my_peep = my_peeps.last
    expect(my_peep[:date]).to include "#{Time.now.year}-#{Time.now.month}-#{check_leading_zero(Time.now.day)}"
  end

end
