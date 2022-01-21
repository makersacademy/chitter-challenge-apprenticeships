require 'peep'

describe Peep do
  it 'list all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('First peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Second peep');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Third peep');")

    peeps = Peep.all

    expect(peeps).to include("First peep" && "Second peep" && "Third peep")
  end
end
