require 'chitter.rb'

describe Peeps do 
    describe '.all' do 
    it 'display all messages' do 
        connection = PG.connect(dbname: 'chitter_test')

        # Add the test data
        connection.exec("INSERT INTO peeps (message) VALUES ('Hello');")
        connection.exec("INSERT INTO peeps (message) VALUES ('Hi');")


        posts = Peeps.all

        expect(posts).to include('Hello')
        expect(posts).to include('Hi')
    end
  end
end