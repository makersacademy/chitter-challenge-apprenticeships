require 'pg'
require 'database_connection'

describe DatabaseConnection do
  it 'connects to the database and shows message' do 
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES ($1);", ['Hi there Chitter!'])
    result = DatabaseConnection.query(
      "SELECT * FROM peeps;", 
    )
    result.map { |message| { "id" => message['id'], "message" => message['message'] } }
    expect(result[0]['message']).to eq 'Hi there Chitter!'
  end
end
