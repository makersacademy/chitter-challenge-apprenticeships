require 'pg'
class Peeps

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else 
            connection = PG.connect(dbname: 'chitter')
        end     

          result = connection.exec("SELECT * FROM peeps")
          result.map { |peep|  peep['message'] }
    end    

    def self.create(message:, date:)
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
      
        connection.exec("INSERT INTO peeps (date, message) VALUES('#{date}','#{message}') RETURNING id, message, date")
      end


end     