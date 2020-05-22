require 'PG'

class Chitter
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

    result = connection.exec('SELECT * FROM chitter;')
    result.map do |chitter|
      Chitter.new(id: chitter['id'], message: chitter['message'])
    end
  end
end