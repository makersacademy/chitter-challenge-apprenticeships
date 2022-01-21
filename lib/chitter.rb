require 'pg'

class Chitter
  # attr_reader :id , :message , :post_date

  # def initialize (id:, message:, post_date:)
  #   @id = id
  #   @message = message
  #   @post_date = post_date 
  # end

  def self.all

    if ENV['ENVIRONMENT'] == 'test' 
      connection = PG.connect(dbname: 'chitter_test')
    else 
      connection = PG.connect(dbname: 'chitter')
    end

    results = connection.exec("SELECT * FROM peeps;")

    results.map { |row| p row["message"] }
    
    # results.map do |row|
    #   Chitter.new(id: row["id"], message: row["message"], post_date: row["post_date"])
    # end

  end

  # private 

  # def test?
  #   if ENV['ENVIRONMENT'] == 'test' 
  #     connection = PG.connect(dbname: 'chitter_test')
  #   else 
  #     connection = PG.connect(dbname: 'chitter')
  #   end
  # end

end