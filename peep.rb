require 'pg'

class peep
    attr_reader :id, :message
    
    def initialize(id:, message:)
        @id = id
        @message = message
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec('SELECT * FROM bookmarks')
        result.map {|peep| peep['message']}
    end

    def self.add(message:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec('INSERT INTO chitter (message) values(:message) ')
