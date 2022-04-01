require 'pg'

class Peeps

  attr_reader :id, :message, :entry_date
  
  def initialize(id:, message:, entry_date:)
    @id = id
    @message = message
    @entry_date = entry_date
  end

  def self.open_connection
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else  
      connection = PG.connect(dbname: 'chitter')
    end
  end

  def self.row_to_peep(row)
    Peeps.new(id: row['id'], message: row['message'], entry_date: row['entry_date'])
  end

  def self.all
    connection = open_connection

    result = connection.exec("SELECT * FROM peeps;")
    result.map do |peep|
      row_to_peep(peep)
    end
  end

  def self.create(message:, entry_date:)
    connection = open_connection

    result = connection.exec_params("INSERT INTO peeps (message, entry_date) VALUES($1, $2) RETURNING id, message, entry_date;", [message, entry_date])
    row_to_peep(result[0])
  end

  def self.reverse_chronology
    connection = open_connection

    result = connection.exec("SELECT * FROM peeps ORDER BY entry_date DESC;")
    result.map do |peep|
      row_to_peep(peep)
    end
  end 
end