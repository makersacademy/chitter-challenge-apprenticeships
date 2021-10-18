require 'chitter_model'
require 'helpers/setup_test_database'
require 'database_helpers'

describe '.all' do
  it 'returns a list of bookmarks' do
    PG.connect(dbname: 'chitter_test')

    peep = ChitterModel.add_peeps(message: "This is a peep!")
    ChitterModel.add_peeps(message: "This is also a peep!")

    peeps = ChitterModel.all

    expect(peeps.length).to eq 2
    expect(peeps.first).to be_a ChitterModel
    expect(peeps.first.id).to eq peep.id
    expect(peeps.first.message).to eq 'This is a peep!'
  end
end

describe '.create' do
  it 'creates a new bookmark' do
    peeps = ChitterModel.add_peeps(message: "This is it peeps")

    persisted_data = persisted_data(id: peeps.id)

    expect(peeps).to be_a ChitterModel
    expect(peeps.id).to eq persisted_data['id']
    expect(peeps.message).to eq 'This is it peeps'
  end
end

describe '.delete' do
  it 'deletes the given bookmark' do
    peeps = ChitterModel.add_peeps(message: "Hit me with your best peep")

    ChitterModel.delete_peeps(id: peeps.id)

    expect(ChitterModel.all.length).to eq 0
  end
end
