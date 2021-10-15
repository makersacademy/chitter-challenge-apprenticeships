require 'pg'
require 'date'

class Peeps

  attr_reader :message, :timestamp

  def initialize(message, timestamp)
    @message = message
    @timestamp = Time.parse(timestamp).strftime('%I:%M %p %b %-d, %Y ')
  end

  def self.all
    connection = Peeps.connect
    peeps = connection.exec 'SELECT * FROM peeps;'
    peeps.map do |peep| 
      Peeps.new(
        peep['message'],
        peep['created_at']
      )
    end
  end

  def self.create(peep)
    connection = Peeps.connect
    connection.exec_params("INSERT INTO peeps (message) VALUES ($1);", [peep])
  end

  def self.connect
    db_name = ENV['ENVIRONMENT'] == 'test' ? 'chitter_test' : 'chitter'
    return PG.connect dbname: db_name
  end
end