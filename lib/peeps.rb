require 'pg'

class Peeps
  attr_reader :id , :message , :post_date

  def initialize (id:, message:, post_date:)
    @id = id
    @message = message
    @post_date = post_date 
  end

  def self.all

    if ENV['ENVIRONMENT'] == 'test' 
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end

    results = connection.exec("SELECT * FROM peeps;")

    results.map { |post| post["message"] }
    
    results.map do |post|
      Peeps.new(id: post["id"], message: post["message"], post_date: post["post_date"])
    end

  end

  def self.new_peep(message:)

    if ENV['ENVIRONMENT'] == 'test' 
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end

    connection.exec_params("INSERT INTO peeps (message) values ($1);", [message])
  end 

end