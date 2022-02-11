describe 'all' do
  it 'reads from the database' do
    conn = PG.connect(dbname: "chitter_test")
    conn.exec("INSERT INTO peeps (message) VALUES('Hello');")

    chitter = Peeps.all

    expect(chitter).to include('Hello')
  end
end