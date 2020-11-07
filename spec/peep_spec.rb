
require 'Peep'
require_relative 'setup_test_database'

describe Peep do

before(:each) do
  setup_test_database
end

describe '.all' do
  it "will show a list of all messages" do
  connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('This is message 1');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is message 2');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is message 3');")

      peep = Peep.all
      m = "message"
      expect(peep["message"]).to include('This is message 1')
      expect(peep["message"]).to include('This is message 2')
      expect(peep["message"]).to include('This is message 3')
  end
end
describe '.create' do
  it 'creates a new peep' do
    Peep.create(message: 'Here is a newly created message', date: '12/10/20')

    expect(Peep.all).to include 'Here is a newly created message'
  end
end
end
