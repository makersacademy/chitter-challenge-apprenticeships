require 'peep'
require 'setup_test_database'

describe '.all' do
  it 'returns list of peeps' do
    setup_test_database

    message = Peep.create(message: "Here!")
    Peep.create(message: "Present!")
    Peep.create(message: "Ello!")
    
    bookmarks = Bookmark.all

    expect(bookmarks.length).to eq 3
    expect(bookmark.first).to be_a Bookmark
    expect(bookmark.first.id).to eq bookmark.id
    expect(bookmark.first.title).to eq 'Makers Academy'
  end
end
