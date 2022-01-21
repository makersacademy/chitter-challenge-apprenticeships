class Message

  attr_reader :id, :message, :time

  def initialize(id:, message:, time:)
    @id = id
    @message = message
    @time = time
  end

  def self.all
    result = connect_to_db.exec("SELECT * FROM peeps ORDER BY id DESC;")
    result.map { |peep| Message.new(id: peep['id'], message: peep['message'], time: peep['time']) }
  end

  private_class_method def self.connect_to_db
    database = 'chitter'
    database += '_test' if ENV['ENVIRONMENT'] == 'test'
    PG.connect(dbname: database)
  end

end
