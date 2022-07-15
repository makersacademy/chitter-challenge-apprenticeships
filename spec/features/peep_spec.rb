require 'peep'

describe '.all' do
  it 'returns all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES ('So is this!');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Also this!');")

    peeps = Peep.all

    expect(peeps).to include("This is a peep!")
    expect(peeps).to include("So is this!")
    expect(peeps).to include("Also this!")
  end
end




