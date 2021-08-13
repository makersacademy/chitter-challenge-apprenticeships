require 'homepage'

describe "HomePage" do

  it 'returns a list of bookmarks' do
    connection = PG.connect(dbname: 'chitter')
    homepage = HomePage.all
    expect(homepage.length).to eq 1 #make this better
  end
end