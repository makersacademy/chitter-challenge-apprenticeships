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

      expect(peep).to include('This is message 1')
      expect(peep).to include('This is message 2')
      expect(peep).to include('This is message 3')
  end
end
end
