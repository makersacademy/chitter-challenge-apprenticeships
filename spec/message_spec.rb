# frozen_string_literal: true

# in spec/bookmark_spec.rb

require 'message'

describe Message do
  describe '.all' do
    it 'returns all posts' do
      connection = PG.connect(dbname: 'messages_app_test')

      # Add the test data
      connection.exec("INSERT INTO messages (name, message, time) VALUES ('fred', 'wow nice test', '#{Time.now}');")
      connection.exec("INSERT INTO messages (name, message, time) VALUES ('phil', 'i love capybara', '#{Time.now}');")
      connection.exec("INSERT INTO messages (name, message, time) VALUES ('jim', 'no SQL inject pls', '#{Time.now}');")

      posts = Message.all

      expect(posts[0]).to include 'jim'
      expect(posts[1]).to include('i love capybara')
      expect(posts[2]).to include('fred')
    end
  end
end
