require 'pg'
require 'date'

class Peep
    attr_reader :id, :message, :date

    def initialize(id:, message:, date:)
      @id = id
      @message = message
      @date = Date.today
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
        else
        connection = PG.connect(dbname: 'chitter')
        end

        result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
        result.map do |peep| peep
        Peep.new(id: peep['id'], message: peep['message'], date:['date'])
        end
    end

  def self.create(message:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, date")
    Peep.new(id: result[0]['id'], message: result[0]['message'], date: result[0]['date'])
  end
end