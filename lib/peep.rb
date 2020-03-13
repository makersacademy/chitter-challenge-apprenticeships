require 'pg'

class Peep
  attr_reader :id, :message, :author

  def initialize(id:, message:, author:)
    @id = id
    @message = message
    @author = author
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connectipn = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], author: peep['author'])
    end
    # [
    #   'This is a peep!',
    #   'I saw a fox!'
    # ]
  end

  def self.post(message:, author:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec("INSERT INTO peeps (message, author) VALUES('#{message}', '#{author}') RETURNING id, message, author;")
    Peep.new(id: result[0]['id'], message: result[0]['message'], author: result[0]['author'])
  end

end
