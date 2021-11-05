require 'pg'
require 'peeps'

describe 'Peeps' do
  it 'returns all peeps' do
    conn = PG.connect(dbname: 'chitter_test')
    my_peeps = Peeps.all
    expect(my_peeps).to include "This is a peep!"
  end
end