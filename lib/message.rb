require 'pg'

class Message
    def self.all
    #   [
    #     "I am a frog",
    #    ]
    result = connection = PG.connect(dbname: 'chitter')
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |message| message['message'] }
    end
  end