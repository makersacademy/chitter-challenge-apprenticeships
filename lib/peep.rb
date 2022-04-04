require 'pg'

class Peep

  attr_reader :id, :message, :username, :posted_at

  def initialize(id:, message:, username:, posted_at:)
    @id  = id
    @message = message 
    @username = username 
    @posted_at = posted_at
  end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'chitter_test')
        else
          connection = PG.connect(dbname: 'chitter')
        end
        result = connection.exec("SELECT * FROM peeps")
        result.map do |peep|
          Peep.new(id: peep['id'], message: peep['message'], username: peep['username'], posted_at: peep['posted_at'])
        end
    end

    def self.add(message:, username:, posted_at:)
            if ENV['ENVIRONMENT'] == 'test'
              connection = PG.connect(dbname: 'chitter_test')
            else
              connection = PG.connect(dbname: 'chitter')
            end
            
            result = connection.exec("INSERT INTO peeps (id, message, username, posted_at) VALUES (DEFAULT, '#{message}', '#{username}', CURRENT_TIMESTAMP) RETURNING id, message, username, posted_at;")
            Peep.new(id: result[0]['id'], message: result[0]['message'], username:result[0]['username'], posted_at:result[0]['posted_at'])
    end

  

end