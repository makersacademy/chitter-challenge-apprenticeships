require_relative 'database_connection'
require 'pg'

class Peep

    attr_reader :message, :timestamp

    def initialize(message:, timestamp:)
        @message = message
        @timestamp = timestamp
    end

    def self.all
        result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY timestamp DESC")
        result.map do |peep|
        Peep.new(
            message: peep['message'],
            timestamp: peep['timestamp']
        )
        end
    end

    def self.create(message)
        result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING message, timestamp;")
        Peep.new(message: result[0]['message'], timestamp: result[0]['timestamp'])
    end

    def self.search(keyword)
        results = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%';")
        results.map do |result|
            Peep.new(
                message: result['message'],
                timestamp: result['timestamp']
            )
            end
        end
end