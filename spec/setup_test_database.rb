# frozen_string_literal: true

def setup_test_database
  require 'pg'

  p 'Setting up test database...'

  connection = PG.connect(dbname: 'messages_app_test')

  # Clear the bookmarks table
  connection.exec('TRUNCATE messages;')
end
