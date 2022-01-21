require 'pg'

class Message

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.create(message:)
    time = Time.now.strftime("Posted on %d.%m.%Y at %I:%M %p")
    connect_to_db.exec_params("INSERT INTO peeps(message,time) VALUES($1, $2);", [message,time])
  end

  def self.all
    result = connect_to_db.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map { |peep| Message.new(id: peep['id'], message: peep['message'], time: peep['time']) }
  end

  def self.filter_by(tag:)
    result = connect_to_db.exec_params("SELECT * FROM peeps WHERE LOWER(message) LIKE '%#{tag}%' 
                                                            ORDER BY id DESC;", [])
    result.map { |peep| Message.new(id: peep['id'], message: peep['message'], time: peep['time']) }
  end

  private_class_method def self.connect_to_db
    database = 'chitter'
    database += '_test' if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: database)
  end

end
