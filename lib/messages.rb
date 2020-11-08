require 'pg'

class Message
    def self.list
        connection = PG.connect(dbname: 'chitter')
        result = connection.exec('SELECT * FROM peeps')
        result.map { |message| message['message'] } #for each record return the 'message' column
    end
end