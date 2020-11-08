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
      expect(peep[0]).to include('This is message 1')
      expect(peep[1]).to include('This is message 2')
      expect(peep[2]).to include('This is message 3')
    end
  end
  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'Here is a newly created message', date: '12/10/20')
      peep = Peep.all
      expect(peep[0]).to include 'Here is a newly created message'
    end
  end
  describe '.search' do
    it 'the user can search for a keyword and a list of matching messages will be returned' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('This is message 1');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is message 2');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is message 3');")

      peep = Peep.search(keyword: "message")
      expect(peep.length).to eq 3
    end

    end
  end
