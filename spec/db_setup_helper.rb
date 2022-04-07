require './lib/database_connection'

p "Reading the Environment Variable"
if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end
