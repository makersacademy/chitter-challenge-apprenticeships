require 'peep'
require 'database_helpers'

# describe Peep do
#   describe '.all' do
#     it 'returns all peeps' do
#       peep = Peep.all

#       expect(peep).to include("This is a peep!")
#     end
#   end
# end

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    peep = Peep.create(username: "User1", message: "This is a peep!")
    Peep.create(username: "User2", message: "Here is another peep!")
    Peep.create(username: "User3", message: "One more peep!")

    peeps = Peep.all

    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.username).to eq 'User1'
    expect(peeps.first.message).to eq 'This is a peep!'
  end
end

describe '.create' do
  it 'creates a new peep message' do
    peep = Peep.create(username: 'Username', message: 'An example of a peep')

    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.username).to eq 'Username'
    expect(peep.message).to eq 'An example of a peep'
  end
end
