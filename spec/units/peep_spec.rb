require_relative '../setup_test_database.rb'

describe Peep do

  it 'shows all peeps' do
    add_row_to_test_database
    peeps = Peep.all
    expect(peeps.first['message']).to eq 'This is a peep!'
  end

  it 'adds peeps' do
    add_row_to_test_database
    connection = PG.connect(dbname: 'chitter_test')
    result = connection.exec("SELECT * FROM peeps;")
    expect(result.first['message']).to eq 'This is a peep!'
  end

end
