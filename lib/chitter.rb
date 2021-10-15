require 'pg'

class ChitterModel

  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    connection = ChitterModel.create_db

    result = connection.exec_params("SELECT * FROM peeps;")
    result.map do |peep|
      ChitterModel.new(id: peep['id'], message: peep['message'])
    end
  end

  def self.add_peeps(message:)
    connection = ChitterModel.create_db

    result = connection.exec_params("INSERT INTO peeps (message) VALUES($1) RETURNING id, message;", [message])
    ChitterModel.new(id: result[0]['id'], message: result[0]['message'])

  end


  private

  def self.create_db
      if ENV['ENVIRONMENT'] == 'test'
        PG.connect(dbname: 'chitter_test')
      else
        PG.connect(dbname: 'chitter')
      end
    end
end