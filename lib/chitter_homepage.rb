require 'pg'

class Chitter_Page
  def self.view
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end
    total = connection.exec("SELECT * FROM peeps ORDER BY message_date DESC;")

    total.map do |peep|
      { message: peep["message"] , message_date: peep["message_date"] }
    end
  end


  def self.create(message, message_date)
    if ENV["ENVIRONMENT"] == "test"
      connection = PG.connect(dbname: "chitter_test")
    else
      connection = PG.connect(dbname: "chitter")
    end 
    # message_date = Time.now.strftime("%m/%d/%Y")
    # @message = message_date.to_s
    connection.exec("INSERT INTO peeps (message, message_date) VALUES('#{message}', #{message_date})")
  end

  # def self.date
  #   if ENV["ENVIRONMENT"] == "test"
  #     connection = PG.connect(dbname: "chitter_test")
  #   else
  #     connection = PG.connect(dbname: "chitter")
  #   end 
    
  #   connection.exec("INSERT INTO peeps (message_date) VALUES('#{date}')")

  # end

end