require 'pg'

class Peep
    attr_reader :id, :message, :date

    def initialize(id:, date:, message:)
        @id = id
        @date = date
        @message = message
    end

    def self.all
        connection = PG.connect(dbname: 'chitter_test')
        result = connection.exec('SELECT * FROM peeps')
        result.map do |peep|
            Peep.new(
                id: peep['id'],
                message: peep['message'],
                date: peep['date']
            )
        end
    end

    def self.create(message:)
        connection = PG.connect(dbname: 'chitter_test')
        result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date")
        Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
    end

    def self.sort
        connection = PG.connect(dbname: 'chitter_test')
        result = connection.exec("SELECT * FROM peeps ORDER_BY date DESC;")
        result.map do |peep|
            Peep.new(
                id: peep['id'],
                message: peep['message'],
                date: peep['date']
            )
        end
    end
end