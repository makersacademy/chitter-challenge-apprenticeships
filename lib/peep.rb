require 'pg'

class Peep
    attr_reader :id, :message

    def initialize(id:, message:)
        @id = id
        @message = message
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec('SELECT * FROM peeps')
        result.map { |peep| peep['message'] }
    end

    def self.create(message:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
        else
            connection = PG.connect(dbname: 'chitter')
        end
    
        result = connection.exec_params("INSERT INTO peeps (message) VALUES($1) RETURNING id, message;", [message])
        Peep.new(id: result[0]['id'], message: result[0]['message'])
      end

end