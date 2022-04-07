require 'pg'
require 'db_setup_helper'

def persisted_data(id:, table:)
  connection = PG.connect(dbname: 'chitter_test')
  connection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
end
