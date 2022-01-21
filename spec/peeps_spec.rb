describe '#list' do
  it 'returns a list of messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, date) VALUES ('Hello', '2020-01-01');")
    connection.exec("INSERT INTO  peeps (message, date) VALUES('Hi', '2021-01-01');")
    connection.exec("INSERT INTO peeps (message, date) VALUES('Bonjour', '1999-01-02');")

    peeps = Peeps.list

    expect(peeps.length).to eq 3
    expect(peeps.first.message).to eq 'Hello'
  end
end

describe '#create' do
  it 'creates a new message' do
    peeps = Peeps.create(message: 'Hello', date: '1992-05-01')

    expect(Peeps.list.first.message).to eq 'Hello'
    expect(Peeps.list.first.date).to eq '1992-05-01'
  end
end