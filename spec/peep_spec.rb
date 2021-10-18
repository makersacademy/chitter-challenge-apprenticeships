require 'peep'
require 'Time'

describe '.all' do
  it 'returns a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    time = Time.now.ctime
    connection.exec("INSERT INTO peeps (id, message, date) VALUES (1, 'My first peep', '#{time}');")
    connection.exec("INSERT INTO peeps (id, message, date) VALUES(2, 'Elon Musk posts dumb stuff on chitter', '#{time}');")
    connection.exec("INSERT INTO peeps (id, message, date) VALUES(3, 'I like dogs more than cats', '#{time}');")

    peeps = Peep.all

    message1 = "My first peep - #{time}"
    message2 = "Elon Musk posts dumb stuff on chitter  - #{time}"
    message3 = "I like dogs more than cats  - #{time}"

    expect(peeps).to include(message1)  
    expect(peeps).to include(message2)
    expect(peeps).to include(message3)
  end
end