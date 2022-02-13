require 'peep'

describe '.all' do
  it 'returns a list of peeps' do
    add_row_to_test_database

    peeps = Peep.all
    expect(peeps).to include('This is a peep!')
    expect(peeps).to include('Meditate to evolve.')
    expect(peeps).to include('Stay in the present moment.')
    expect(peeps).to include('Being of service to others is what brings true happiness.')
  end
end




