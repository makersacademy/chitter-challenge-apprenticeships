require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('chitter_test')
else
  DatabaseConnection.setup('chitter')
end

# What is database? Why is database? Who is database?
