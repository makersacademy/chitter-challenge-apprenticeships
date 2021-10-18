require 'pg'

class ChitterModel

  attr_reader :id, :message, :date_posted

  def initialize(id:, message:, date_posted:)
    @id = id
    @message = message
    @date_posted = date_posted
  end

  def self.all
    connection = ChitterModel.connect_db

    result = connection.exec_params("SELECT * FROM peeps;")
    result.map do |peep|
      ChitterModel.new(id: peep['id'], message: peep['message'], date_posted: peep['date_posted'])
    end
  end

  def self.add_peeps(message:)
    connection = ChitterModel.connect_db

    result = connection.exec_params("INSERT INTO peeps (message) VALUES($1) RETURNING id, message;", [message])
    ChitterModel.new(id: result[0]['id'], message: result[0]['message'], date_posted: result[0]['date_posted'])
  end

  def self.delete_peeps(id:)
    connection = ChitterModel.connect_db

    connection.exec_params("DELETE FROM peeps WHERE id = $1", [id])
  end

  private

  def self.connect_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end

end