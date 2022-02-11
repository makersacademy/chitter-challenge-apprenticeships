require 'pg'

class Message
  attr_reader :id, :name, :message

  def initialize(id:, name:, message:)
    @id = id
    @name = name
    @message = message
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("SELECT * FROM peeps")
    result.map { |i| Message.new(id: i['id'], name: i['name'], message: i['message']) }
    # "#{i['name']} - #{i['message']}"
  end

  def self.create(name:, message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (name, message) VALUES('#{name}', '#{message}') RETURNING id, name, message;")
    Message.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'])
  end
end
