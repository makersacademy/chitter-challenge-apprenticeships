require 'peep'
describe '#all' do
  it 'lists all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    Peep.add(message: "Hi", date: "1 June")
    peeps = Peep.all
    expect(peeps.length).to eq 1
    expect(peeps.first.message).to eq "Hi"
  end
end
