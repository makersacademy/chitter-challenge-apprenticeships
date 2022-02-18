require 'peeps'

describe Peep do
  it 'returns all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('This is my first peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('This is my second peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('This is my third peep');")

    peeps = Peep.all

    expect(peeps).to include "This is my first peep"
    expect(peeps).to include "This is my second peep"
    expect(peeps).to include "This is my third peep"
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(message: 'peep')
    expect(Peep.all).to include("peep")
  end
end
