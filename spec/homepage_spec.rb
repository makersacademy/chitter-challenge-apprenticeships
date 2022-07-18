require 'pg'
require 'peep'

describe '.all' do
  it 'returns all peeps in reverse chronological order' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    Peep.create('New Peep 1!')
    Peep.create('Yoyoyo!')
    Peep.create('http://www.google.com')

    peeps = Peep.all

    expect(peeps).to include('New Peep 1!')
    expect(peeps).to include('Yoyoyo!')
    expect(peeps).to include('http://www.google.com')
  end
end

describe '.create' do
  it 'adds peeps to the database' do
    connection = PG.connect(dbname: 'chitter_test')
    Peep.create("Peep peep!")
    peeps = Peep.all
    expect(peeps).to include('Peep peep!')
  end
end