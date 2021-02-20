require './lib/peep'
require 'setup_test_database'

describe '.all' do
  it 'returns list of peeps' do
    setup_test_database

    message_test = Peep.create(message: "Here!")
    Peep.create(message: "Present!")
    Peep.create(message: "Ello!")
    
    message_test = Peep.all

    expect(bookmarks.length).to eq 3
    expect(bookmark.first).to be_a Peep
    expect(bookmark.first.id).to eq message_test.id
    expect(bookmark.first.message).to eq 'Here!'
  end
end
