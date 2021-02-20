require 'pg'
require './lib/peep'

describe '.all' do
  it 'returns list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    message_test_1 = Peep.create(message: "Here!")
    Peep.create(message: "Present!")
    Peep.create(message: "Ello!")
    
    message_test_2 = Peep.all
    p message_test_1
    expect(message_test_2.length).to eq 3
    # expect(message_test_1).to be_a Peep
    expect(message_test_1.first.id).to eq message_test.id
    expect(message_test_1.first.message).to eq 'Here!'
  end
end
