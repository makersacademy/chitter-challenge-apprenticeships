require 'pg'
require_relative 'db'

class Message

  attr_reader :id, :message, :date

  def initialize(id:, message:, date:)
    @id = id
    @message = message
    @date = date
  end

  def self.all
    connection = Db.connect
    result = connection.exec("SELECT * FROM peeps")
    result.map do |message|
      Message.new(id: message['id'], message: message['message'], date: message['date'])
    end
     
  end

  def self.create(message:) 
    connection = Db.connect
    connection.exec("INSERT INTO peeps (message,date) VALUES('#{message}',current_timestamp)")
  end

  def self.sort
    connection = Db.connect
    result = connection.exec("SELECT * FROM peeps ORDER BY date DESC;")
    result.map do |message|
      Message.new(id: message['id'], message: message['message'], date: message['date'])
    end
  end

  def self.search(search:)
    connection = Db.connect
    result = connection.exec("SELECT * FROM peeps WHERE message iLIKE '#{search}%';")
    result.map do |message|
      Message.new(id: message['id'], message: message['message'], date: message['date'])
    end
     
  end

end
