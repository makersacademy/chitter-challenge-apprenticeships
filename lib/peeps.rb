require 'pg'

class Peeps

    attr_reader :message, :add_date

    def initialize( message:, add_date: )
        @message = message
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY add_date DESC;")
        result.map do |peep|
            Peeps.new(message: peep['message'], add_date: peep['add_date']  )
        end
    end

    def self.create(message:)
        result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message, add_date")
        Peeps.new(message: result[0]['message'], add_date: result[0]['add_date'] ) 
       
    end

    def self.find(keyword:)
        result = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%';")
        result.map do |peep|
            Peeps.new(message: peep['message'], add_date: peep['add_date']  )
        end
    end



end
