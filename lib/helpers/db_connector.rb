def db_connection
  database_name = ENV['RACK_ENV'] == 'development' ? 'chitter' : 'chitter_test'
  con = PG.connect dbname: database_name, user: ENV['USER']
end
