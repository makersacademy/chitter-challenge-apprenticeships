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
    connection.exec_params("INSERT INTO peeps (message,date) VALUES($1,current_timestamp);",[message])
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
    result = connection.exec_params("SELECT * FROM peeps WHERE message iLIKE '#{search}%';")
    result.map do |message|
      Message.new(id: message['id'], message: message['message'], date: message['date'])
    end
     
  end

end
