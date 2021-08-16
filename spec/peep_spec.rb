require 'peep.rb'

describe '.all' do
  it 'returns a list of peeps' do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")


    peeps = Peep.all

   expect(peeps).to include 'This is a peep!'
  end
end

describe '.create' do
  it 'creates a new peep' do
    Peep.create(message: 'Peep this!')

    expect(Peep.all).to include 'Peep this!'
  end
end