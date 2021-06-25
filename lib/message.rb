require 'pg'

class Message
    def self.all

        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        # else 
        #     connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec('SELECT * FROM peeps')
        result.map do |message| 
            Message.new(id: message['id'], message: message['message']) 
        end

    end

    def self.create(message:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        # else 
        #     connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message;")
        Message.new(id: result[0]['id'], message: result[0]['message'])

    end

    attr_reader :id, :message

    def initialize(id:, message:)
        @id  = id
        @message = message
    end
end


