require 'peep'

describe Peep do
  it 'returns all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
    
    peeps = Peep.all

    expect(peeps).to include("This is a peep!")
  end
end