require 'pg'
require './lib/database'

class Peep

    attr_reader :id, :message, :name, :created_at

    def initialize(id:, message:, name:, created_at:)
        @id  = id
        @message = message
        @name = name
        @created_at = created_at
    end

    def self.all
        connection = select_db
        result = connection.exec(
            "SELECT peeps.id, peeps.message, author.name, peeps.created_at
            FROM peeps JOIN author ON peeps.author_id = author.id 
            WHERE author.id != 1
            ORDER BY peeps.created_at DESC;")
        result.map { |peep| 
            Peep.new(id: peep['id'], message: peep['message'], name: peep['name'], created_at: peep['created_at'])
        }
    end

    def self.own_peeps
        connection = select_db
        result = connection.exec("
        SELECT peeps.id, peeps.message, author.name, peeps.created_at
        FROM peeps JOIN author ON peeps.author_id = author.id 
        WHERE author_id = 1
        ORDER BY peeps.created_at DESC;")
        result.map { |peep|
            Peep.new(id: peep['id'], message: peep['message'], name: peep['name'], created_at: peep['created_at'])
        }
    end

    def self.post(message:, author_id:)
        connection = select_db
        result = connection.exec_params(
            "INSERT INTO peeps (message, author_id) 
            VALUES($1, $2) RETURNING id, message, author_id;", [message, 1]) 
            Peep.new(id: result[0]['id'], message: result[0]['message'], name: result[0]['name'], created_at: result[0]['created_at'])
    end


    def self.search(keyword:)
        connection = select_db
        result = connection.exec(
            "SELECT peeps.id, peeps.message, author.name, peeps.created_at
            FROM peeps JOIN author ON peeps.author_id = author.id 
            WHERE author.id != 1 AND peeps.message LIKE '%#{keyword}%'
            ORDER BY peeps.created_at DESC;")
        result.map { |peep| 
            Peep.new(id: peep['id'], message: peep['message'], name: peep['name'], created_at: peep['created_at'])
        }
    end

    def self.select_db
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
    end
end