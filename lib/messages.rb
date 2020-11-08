require 'pg'

class Message

    attr_reader :chit

    def initialize(chit:)
        @chit = chit
    end

    def self.list
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        
        result = connection.exec('SELECT * FROM peeps')
        result.map { |message| message['message'] } #for each record return the 'message' column
    end

    def self.add(chit:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end

        connection.exec("INSERT INTO peeps (message) VALUES('#{chit}')")
    end
end