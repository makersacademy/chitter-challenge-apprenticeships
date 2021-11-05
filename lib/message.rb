require 'pg'

class Message
    def self.all
    #   [
    #     "I am a frog",
    #    ]
    connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |message| message['message'] }
    end

    def self.add(message:)
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'chitter')
          else
            connection = PG.connect(dbname: 'chitter')
          end
        connection.exec("INSERT INTO peeps (message) VALUES('#{message}')")
    end
  end