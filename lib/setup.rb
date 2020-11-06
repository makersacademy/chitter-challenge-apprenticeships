require_relative 'dbcon'
if ENV['RACK_ENV'] == 'test'
  DatabaseConnection.setup('chitter_test') # connecting to database
else
  DatabaseConnection.setup('chitter') # connecting to database
end
