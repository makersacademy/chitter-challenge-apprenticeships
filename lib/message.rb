# require 'pg'

# class Message
#   def self.all
#     connection = PG.connection(dbname: 'chitter')
#     connection.exec('SELECT * FROM peeps;')
#   end
# end