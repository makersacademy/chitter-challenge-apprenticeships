require 'pg'

class Peep
    attr_reader :id, :message, :date, :keyword

    def initialize(id:, date:, message:)
        @id = id
        @date = date
        @message = message
    end

    def self.all
        result = DatabaseConnection.query('SELECT * FROM peeps')
        result.map do |peep|
            Peep.new(
                id: peep['id'],
                message: peep['message'],
                date: peep['date']
            )
        end
    end

    def self.create(message:)
        result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date")
        Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
    end

    def self.sort
        connection = PG.connect(dbname: 'chitter_test')
        result = connection.exec("SELECT * FROM peeps ORDER BY date DESC;")
        result.map do |peep|
            Peep.new(
                id: peep['id'],
                message: peep['message'],
                date: peep['date']
            )
        end
    end
    
    def self.filtered(keyword)
        connection = PG.connect(dbname: 'chitter_test')
        result = connection.exec("SELECT * FROM peeps;")
        result.each do |peep|
            if peep.include?(keyword)
                return peep
            else
                return "Nothing was found"
            end
        end
    end
end