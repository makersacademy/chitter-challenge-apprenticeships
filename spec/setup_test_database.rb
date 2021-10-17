require 'pg'
require 'date'

def setup_test_database
  connection = connect
  connection.exec("TRUNCATE peeps;")
end

def add_row_to_test_database
  connection = connect
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('This is a peep!', '#{DateTime.new(2021, 10, 14)}');")
end

def add_multiple_peeps_with_default_date
  connection = connect
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('This is peep1', '#{DateTime.new(2021, 10, 14)}');")
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('This is peep2', '#{DateTime.new(2021, 10, 14)}');")
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('This is peep3', '#{DateTime.new(2021, 10, 14)}');")
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('This is peep4', '#{DateTime.new(2021, 10, 14)}');")
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('This is peep5', '#{DateTime.new(2021, 10, 14)}');")
end

def add_two_peeps_from_different_days
  connection = connect
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('I am newer', '#{DateTime.new(2021, 10, 14)}');")
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('I am older', '#{DateTime.new(2020, 10, 14)}');")
end

def add_peep_for_filter
  connection = connect
  connection.exec("INSERT INTO peeps (message, time_stamp) values ('custom peep', '#{DateTime.new(2021, 10, 14)}');")
end

private

def connect
  PG.connect(dbname: 'chitter_test')
end
