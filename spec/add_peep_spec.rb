require 'peep'
describe '#add' do
  it 'add a new peep' do
    peep = Peep.add(message:"Welcome", date:"1 May")
    PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE message = '#{peep.message}';")
    expect(peep.message).to eq "Welcome"
    expect(peep.date).to eq "1 May"
    expect(peep).to be_a Peep
  end
end
