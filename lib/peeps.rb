require 'PG'

class Peeps
  attr_reader :id, :message
  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec('SELECT * FROM peeps;')
    result.map do |peeps|
      Peeps.new(id: peeps['id'], message: peeps['message'])
    end
  end

  def self.create(message:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message")
    Peeps.new(id: result[0]['id'], message: result[0]['message'])
  end
end