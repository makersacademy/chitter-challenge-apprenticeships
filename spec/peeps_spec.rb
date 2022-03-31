require 'peeps'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    chitter = Peeps.create(message: "Test peep!")
    Peeps.create(message: "Second test peep!")
    Peeps.create(message: "Third test peep!")

    chitter = Peeps.all

    expect(chitter.length).to eq 3
    expect(chitter.first).to be_a Peeps
    expect(chitter.first.message).to eq "Test peep!"
  end
end