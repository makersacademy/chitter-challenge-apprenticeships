require 'homepage'

describe "HomePage" do

  it 'returns a list of posts' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE peeps;")
    connection.exec("INSERT INTO peeps (message, date) VALUES('post', '#{Time.now}');")
    connection.exec("INSERT INTO peeps (message, date) VALUES('post2', '#{Time.now}');")
    connection.exec("INSERT INTO peeps (message, date) VALUES('post3', '#{Time.now}');")
    connection.exec("INSERT INTO peeps (message, date) VALUES('post4', '#{Time.now}');")
    result = connection.exec("SELECT * FROM peeps;").to_a
    expect(result[0]['message'].length).to eq(4)
    expect(result[1]['message'].length).to eq(5)
    expect(result[2]['message'].length).to eq(5)
    expect(result[3]['message'].length).to eq(5)
  end
  it 'creates a post' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("TRUNCATE peeps;")
    connection.exec("INSERT INTO peeps (message, date) VALUES('post', '#{Time.now}');")
    result = connection.exec("SELECT * FROM peeps;").to_a
    expect(result[0]['message']).to eq('post')
  end
end