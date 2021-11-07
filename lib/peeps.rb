require 'pg'
require 'database_connection'

class Peeps
    attr_reader :id, :message, :created_at
    def initialize(id:, message:, created_at:)
        @id = id
        @message = message
        @created_at = created_at
    end

    def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end

      result = connection.exec("SELECT * FROM peeps")
      result.map do |peep|
        Peeps.new(id: peep['id'], message: peep['message'], created_at: peep['created_at'])
      end
    end

    def self.create(message:)
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
      result = connection.exec_params(
          "INSERT INTO peeps (message) VALUES($1) RETURNING id, message, created_at;", [message]
      )
      Peeps.new(id: result[0]['id'], message: result[0]['message'], created_at: result[0]['created_at'])
    end

    def self.reverse
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end

      result = connection.exec("SELECT * FROM peeps ORDER BY created_at DESC")
      result.map do |peep|
        Peeps.new(id: peep['id'], message: peep['message'], created_at: peep['created_at'])
      end
    end
end 