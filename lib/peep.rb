require 'pg'
require './lib/database'

class Peep

    attr_reader :id, :message, :author_id

    def initialize(id:, message:, author_id:)
        @id  = id
        @message = message
        @author_id = author_id
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM peeps WHERE author_id != 1;")
        result.map { |peep| 
            Peep.new(id: peep['id'], message: peep['message'], author_id: peep['author_id'])
        }
    end

    def self.own_peeps
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM peeps WHERE author_id = 1;")
        result.map { |peep|
            Peep.new(id: peep['id'], message: peep['message'], author_id: peep['author_id'])
        }
    end

    def self.post(message:, author_id:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
            result = connection.exec_params(
            "INSERT INTO peeps (message, author_id) VALUES($1, $2) RETURNING id, message, author_id;", [message, author_id = 1]) 
            Peep.new(id: result[0]['id'], message: result[0]['message'], author_id: result[0][author_id])
    end
end