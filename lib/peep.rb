require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :message, :post_date

  def initialize(id:, message:, post_date:)
    @id = id
    @message = message
    @post_date = post_date

  end 

 def self.all
  result = DatabaseConnection.query("SELECT id, message, post_date, TO_CHAR(post_date, 'HH24:MI DD/MM/YYYY')posted_date FROM peeps ORDER BY post_date DESC;")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        message: peep['message'], 
        post_date: peep['posted_date']
        )
    end 
  end  


  def self.create(message:, post_date:)
   result = DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{message}') RETURNING id, message, post_date;")
   peep = result.map do |peep|
    Peep.new(
      id: peep['id'], 
      message: peep['message'], 
      post_date: peep['post_date'])
    end.first
    peep
  end 

  def self.search(search:)
    result = DatabaseConnection.query("SELECT * FROM peeps WHERE message LIKE '%#{search}%'")
    result.map do |peep|
      Peep.new(
        id: peep['id'], 
        message: peep['message'],
        post_date: peep['post_date']
        )
    end
  end

end 