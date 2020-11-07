require 'pg'

class Peep
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec('SELECT * FROM peeps ORDER BY date DESC')
        result.map {  |peep | peep.values }


end
          def self.create(message:, date:)
            if ENV['ENVIRONMENT'] == 'test'
              connection = PG.connect(dbname: 'chitter_test')
            else
              connection = PG.connect(dbname: 'chitter')
            end

            connection.exec("INSERT INTO peeps (message, date) VALUES('#{message}', '#{date}')")
          end

       def self.search(keyword:)
         if ENV['ENVIRONMENT'] == 'test'
               connection = PG.connect(dbname: 'chitter_test')
             else
               connection = PG.connect(dbname: 'chitter')
             end
             result = connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{keyword}%' ORDER BY date DESC")
            result.map { |peep | peep.values }
p result
end
end
