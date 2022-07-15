require 'peep'

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
    connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")

    peeps = Peep.all

    expect(peeps).to include('This is a peep!')
  end
end
