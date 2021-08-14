require 'homepage'

describe "HomePage" do

  it 'returns a list of posts' do
    connection = PG.connect(dbname: 'chitter_test')
    homepage = HomePage.all
    expect(homepage.length).to eq 1 #make this better
  end
  it 'creates a post' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE peeps;")
    connection.exec("INSERT INTO peeps (message, date) VALUES('post', '#{Time.now}');")
    result = connection.exec("SELECT * FROM peeps;").to_a
    expect(result[0]['message']).to eq('post')
  end
end