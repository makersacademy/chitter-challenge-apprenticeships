require_relative 'lib/database'

database_name = 'chitter'
database_name = 'chitter_test' if ENV['ENVIRONMENT'] == 'test'
Database.connect(database_name)
