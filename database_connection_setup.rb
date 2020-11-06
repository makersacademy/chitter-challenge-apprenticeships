require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  p "test"
  DatabaseConnection.setup('chitter_test')
else
  p "not test"
  DatabaseConnection.setup('chitter')
end
