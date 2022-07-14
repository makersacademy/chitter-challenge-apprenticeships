require 'peep'

describe Peep do
  it 'list all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES (1, 'First peep');")
    connection.exec("INSERT INTO peeps VALUES (2, 'Second peep');")
    connection.exec("INSERT INTO peeps VALUES (3, 'Third peep');")

    peeps = Peep.all

    expect(peeps).to include("First peep" && "Second peep" && "Third peep")
  end
end
