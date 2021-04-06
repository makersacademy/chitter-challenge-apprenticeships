require './lib/peep'
require 'database_helpers'

describe '.all' do
  it 'returns all the messages(peeps)' do
    connection = PG.connect(dbname: 'chitter_test')

    # test data
    peep = Peep.create(message: 'This is a peep!', post_date: '2021-01-01')
    Peep.create(message: 'Happy Thursday everyone', post_date: '2020-07-11')
    Peep.create(message: 'What a lovely Saturday!', post_date: '2020-12-25')

    peeps = Peep.all

    expect(peeps.length).to eq 3
    expect(peeps.first).to be_a Peep
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.message).to eq 'This is a peep!'
  end
end

describe '.create' do
  it 'creates a new message(peep)' do
    peep = Peep.create(message: 'Posting a new peep', post_date: '2021-01-01')
    persisted_data = persisted_data(id: peep.id, table: 'peeps')

    expect(peep).to be_a Peep
    expect(peep.id).to eq persisted_data.first['id']
    expect(peep.message).to eq 'Posting a new peep'
  end
end
