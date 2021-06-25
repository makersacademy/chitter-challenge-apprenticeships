require 'pg'

class Message

    attr_reader :id, :message, :date

    CURRENT_DATE = Time.new.year.to_s + "-" + Time.new.month.to_s + "-" + Time.new.day.to_s

    def initialize(id:, message:, date:)
        @id  = id
        @message = message
        @date = date
    end

    def self.all

        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec('SELECT * FROM peeps')
        result.map do |message| 
            Message.new(id: message['id'], message: message['message'], date: message['date']) 
        end

    end

    def self.create(message:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{CURRENT_DATE}') RETURNING id, message, date;")
        Message.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])

    end

    
end


