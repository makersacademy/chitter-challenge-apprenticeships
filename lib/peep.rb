require 'pg'

class Peep

    def self.all

        if ENV['ENVIRONMENT'] == 'test'
            database_name = 'chitter_test'
        else
            database_name = 'chitter'
        end

    connection = PG.connect(dbname: database_name)
    peeps = connection.exec "SELECT * FROM peeps"
    peeps.each { |row| p row }

    end
end