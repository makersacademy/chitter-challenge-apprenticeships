require 'pg'
require './lib/database_connection'

class Peep

  attr_reader :id, :message, :time_posted

  def initialize(id: , message: , time_posted: )
    @id  = id
    @message = message
    @time_posted = time_posted
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps ORDER BY time_posted DESC;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time_posted: peep['time_posted'])
    end
  end

  def self.write(message:)
    result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, time_posted")
    Peep.new(id: result[0]['id'], message: result[0]['message'], time_posted: result[0]['time_posted'])
  end


end
