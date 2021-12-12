class Message
    attr_reader :id, :message, :date

    def initialize(id, message, date)
        @id = id
        @message = message
        @date = date
    end

    def self.create(message)
        result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES($1) RETURNING message, date;", [message])
        Message.new(result[0]['id'], result[0]['message'], result[0]['date'])
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM peeps;")
        result.map{|value| Message.new(value['id'], value['message'], value['date'])}
    end

end