# frozen_string_literal: true

require 'pg'

# set up class which all posts/tweets have
class Message
  attr_reader :outputs

  def self.all
    outputs = []
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'messages_app_test')
                 else
                   PG.connect(dbname: 'messages_app')
                 end

    result = connection.exec('SELECT * FROM messages ORDER BY user_id DESC;')
    result.each do |message|
      output = []
      output << message['name']
      output << message['message']
      output << message['time']

      outputs << output
    end

    outputs
  end

  def post(name, message, time)
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'messages_app_test')
                 else
                   PG.connect(dbname: 'messages_app')
                 end

    connection.exec("INSERT INTO messages (name, message, time) VALUES ('#{name}', '#{message}', '#{time}');")
  end

  def self.filter(word)
    puts "word = #{word}"

    outputs = []
    connection = if ENV['ENVIRONMENT'] == 'test'
                   PG.connect(dbname: 'messages_app_test')
                 else
                   PG.connect(dbname: 'messages_app')
                 end

    # result = connection.exec("SELECT * FROM messages ORDER BY user_id DESC;")
    result = connection.exec("SELECT * FROM messages WHERE message LIKE '%#{word}%' ORDER BY user_id DESC;")

    result.each do |message|
      output = []
      output << message['name']
      output << message['message']
      output << message['time']

      outputs << output
    end

    outputs
  end
end
