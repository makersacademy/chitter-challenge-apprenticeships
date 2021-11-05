require 'pg'
require 'peeps'

describe 'Peeps' do
  it 'Class returns all peeps' do
    conn = PG.connect(dbname: 'chitter_test')
    my_peeps = Peeps.all
    expect(my_peeps).to include "This is a peep!"
  end
  it 'Class adds a new peep' do
    conn = PG.connect(dbname: 'chitter_test')
    Peeps.add(peep_text: "Class test peep")
    my_peeps = Peeps.all
    expect(my_peeps).to include "Class test peep"
  end
end