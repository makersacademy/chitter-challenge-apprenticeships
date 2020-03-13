describe '.all' do
  it 'returns a list of bookmarks' do
    peeps = Peeps.all

    expect(peeps).to include "http://makers.tech"
    expect(peeps).to include "http://www.destroyallsoftware.com"
    expect(peeps).to include "http://www.google.com"
  end
end