require 'pg'
require './lib/peep'
require 'database_helpers'

describe '.all' do
  it 'returns list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    message_test_1 = Peep.create(message: "Here!")
    Peep.create(message: "Present!")
    Peep.create(message: "Ello!")
    
    message_test_2 = Peep.all

    expect(message_test_2.length).to eq 3
    # expect(message_test_1).to be_a Peep
    expect(message_test_1.id).to eq message_test_1.id
    expect(message_test_1.message).to eq 'Here!'
  end
end

describe '.create' do
  it 'make a new peep' do
    peep = Peep.create(message: 'Making progress...')
    persisted_data = persisted_data(id: peep.id)

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data['id']
    expect(peep.message).to eq 'Making progress...'
  end
end

