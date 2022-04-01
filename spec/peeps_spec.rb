require 'peeps'

describe '.all' do
  it 'returns a list of peeps' do
    setup_test_database

    chitter = Peeps.create(message: "Test peep!", entry_date: "2021-02-15")
    Peeps.create(message: "Second test peep!", entry_date: "2021-02-13")
    Peeps.create(message: "Third test peep!", entry_date: "2021-10-16")

    chitter = Peeps.all

    expect(chitter.length).to eq 3
    expect(chitter.first).to be_a Peeps
    expect(chitter.first.message).to eq "Test peep!"
    expect(chitter.first.entry_date).to eq "2021-02-15"
  end
end

require 'database_helpers'

describe '.create' do
  it 'creates a new peep' do
    chitter = Peeps.create(message: "Test peep!", entry_date: "2021-02-15")
    persisted_data = persisted_data(id: chitter.id)

    expect(chitter).to be_a Peeps
    expect(chitter.id).to eq persisted_data['id']
    expect(chitter.message).to eq "Test peep!"
    expect(chitter.entry_date).to eq "2021-02-15"
  end
end

describe '.filter' do
  it 'filters peeps by keyword' do
    chitter = Peeps.create(message: "Test peep!", entry_date: "2021-02-15")
    Peeps.create(message: "Second test peep!", entry_date: "2021-02-13")
    Peeps.create(message: "Third say hello!", entry_date: "2021-10-16")

    filtered_results = Peeps.filter("Peep")
    expect(filtered_results[0].message).to eq "Test peep!" 
    expect(filtered_results[1].message).to eq "Second test peep!"
  end
end