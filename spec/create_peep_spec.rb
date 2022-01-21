describe '.create' do
  it 'creates a new message' do
    peep = Chittermanager.create(peep: 'testmessage')
    #persisted_data = persisted_data(id: bookmark.id)

    expect(peep).to be_a Chittermanager
    #expect(peep.id).to eq persisted_data['id']
    expect(peep.peep).to eq 'testmessage'
    #expect(bookmark.url).to eq 'http://www.example.org'
  end
end
