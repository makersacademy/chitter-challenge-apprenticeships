require 'pg'

class Message
    def self.all
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
    end
      result = connection.exec("SELECT * FROM peeps;")
      result.map { |message| message['message'] }
    end

    def self.add(message:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter_test')
          else
            connection = PG.connect(dbname: 'chitter')
          end
        connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message;")
    end
  end