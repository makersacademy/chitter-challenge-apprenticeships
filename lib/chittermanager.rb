require_relative 'databasequery'
require 'pg'
require_relative 'chirp'
require 'Time'

class ChitterManager

    # FIND all the database bookmarks
    def self.all

        # Query
        result = DatabaseQuery.query("SELECT * FROM peeps;")

        # Return an array result[row] = Bookmark
        result.map do |chirp|
            Chirp.new(chirp['id'], chirp['message'], chirp['author'], chirp['date'])
        end
    end

    def self.add(content, author)
        time = Time.new
        current_time = "#{time.hour} : #{time.min} , Day  #{time.day}  of  #{time.strftime('%B')}"
        prepared_string = "insert into peeps (message, author, date) VALUES ('#{content}', '#{author}', '#{current_time}') RETURNING id, message, author, date;"
        result = DatabaseQuery.query(prepared_string)
    end

end