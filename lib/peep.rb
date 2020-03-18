require 'pg'

class Peep

  attr_reader :peep
  # :timestamp

  # def initialize(peep)
  #      @peep = peep
  #      # @timestamp = timestamp
  #  end

   def self.all
     if ENV['ENVIROMENT'] == 'test'
       connection = PG.connect(dbname: 'chitter_test')
       #this tells us which database to connect to
     else
       connection = PG.connect(dbname: 'chitter')
     end

     result = connection.exec("SELECT * FROM peeps")
     #once you are in chitter return all peeps stored in table
     #this is exactly how you input when using the database
     result.map{ |peep| peep['message'] }
     #u need to call the value of the hash! hence [message]
     #what does this mean
   end


   def self.create(message:)
     if ENV['ENVIROMENT'] == 'test'
    connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    end
    result = connection.exec("INSERT INTO peeps (message) VALUES ('#{message}')")
    #connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
  end
end



   # def self.create(text)
   #     return false unless long?(text[:peep])
   #
   #     sql_query = "INSERT INTO chitter (peep)
   #                  VALUES('#{text[:peep]}')
   #                  RETURNING id, peep, time_stamp"
   #
   #     result = database.exec(sql_query)
   #     Peep.new(result.first['id'],
   #              result.first['peep'],
   #              result.first['time_stamp'])
   # end

   # def self.database
   #         ENV['ENVIRONMENT'] == 'test'  \
   #          ? PG.connect(dbname: 'chitter_challenge_test')  \
   #          : PG.connect(dbname: 'chitter_challenge')
   #     end
