require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  # :nocov:
  DatabaseConnection.setup('chitter')
  # :nocov:
end
