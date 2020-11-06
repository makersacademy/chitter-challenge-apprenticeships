require 'pg'

class Peep

  attr_reader :peep, :time, :id

  def initialize(peep:, time:, id:)
    @id = id
    @peep = peep
    @time = time
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter')
    end
    result = connection.exec("SELECT * FROM peeps ORDER BY id DESC")
    result.map {|peep| Peep.new(peep: peep['message'], time: peep['time'], id: peep['id'])}
    # result.map { |record| Bookmark.new(id: record['id'], title: record['title'], url: record['url']) }
  end

  def self.create(peep:, time:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname:'chitter_test')
    else
      connection = PG.connect(dbname:'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message, time) VALUES('#{peep}','#{time}') RETURNING id, message, time;")
    Peep.new(id: result[0]['id'], peep: result[0]['message'], time: result[0]['time'])
  end

end
