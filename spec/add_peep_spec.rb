require 'peep'
describe '#add' do
  it 'add a new peep' do
    peep = Peep.add(message:"Welcome")
    PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE message = '#{peep.message}';")
    expect(peep.message).to eq "Welcome"
    expect(peep).to be_a Peep
  end
end
