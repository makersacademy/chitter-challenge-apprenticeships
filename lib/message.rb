require 'pg'

class Message
    attr_reader :id, :message, :date

    def initialize(id:, message:, date:)
      @id = id
      @message = message
      @date = date
    end

    def self.sort
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
            else
            connection = PG.connect(dbname: 'chitter')
            end
            result = connection.exec("SELECT * FROM peeps ORDER BY _date DESC")
            result.map do |message|
                Message.new(id: message['id'], message: message['message'], date: message['_date'])
            end
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
        else
        connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM peeps")
        result.map do |message|
            Message.new(id: message['id'], message: message['message'], date: message['_date'])
        end
         
    end

    def self.make(message:)
        if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
        else
        connection = PG.connect(dbname: 'chitter')
        end
                result = connection.exec_params(
                "INSERT INTO peeps (message) VALUES($1) RETURNING id, message, _date;",[message]
                )
                Message.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['_date'])
    end

end

