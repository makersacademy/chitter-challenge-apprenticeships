require 'pg'

class Peeps
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'chitter_test')
    else
    connection = PG.connect(dbname: 'chitter')
    end
    
    result = connection.exec("SELECT * FROM peeps;")
    result.map { |peeps| peeps['message'] }
  end
end
# becuase i made this method in this class for self.all, i can refactor my peeps page in my app to a peeps.all to take out the array in the app.
# next refactor is to connect the db in this page so it doesnt pull from this array but the from the data that is in the database.
# adding in the connection and executing it with the postgresql commands.
# assigned this step to 'result variable' and to map over it to return the 'peeps'
