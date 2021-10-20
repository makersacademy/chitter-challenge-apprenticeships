require 'pg'

class Peep

  attr_reader :id, :name, :message, :date, :search_results

  def initialize(id:, name:, message:, date:)
    @id = id
    @name = name
    @message = message
    @date = date
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec('SELECT * FROM peeps ORDER BY date DESC;')
    result.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], message: peep['message'], date: peep['date'])
    end
  end

  def self.add(name:, message:, date:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end

    result = connection.exec_params(
      "INSERT INTO peeps (name, message, date) VALUES($1, $2, $3) RETURNING id, name, message, date;", [name, message, date]
      )
    Peep.new(id: result[0]['id'], name: result[0]['name'], message: result[0]['message'], date: result[0]['date'])
  end

  def self.search(search)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
      connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("SELECT * FROM peeps WHERE name LIKE '%#{search}' OR message LIKE '%#{search}';")
    search_results = result.map do |peep|
      Peep.new(id: peep['id'], name: peep['name'], message: peep['message'], date: peep['date'])
    end
    p 'search_results 1'
    p search_results
  end

  # BUG: below method does not work?
  def search_results
    @search_results = @search
  end
end