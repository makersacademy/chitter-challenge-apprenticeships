require "pg"

class Peep 
	attr_reader :message, :date
	def initialize(message, date = '')
		@message = message
		@date = date
	end
	def self.all 
		if (ENV["ENVIRONMENT"] == 'test')
			connection = PG.connect(dbname: 'chitter')
		else 
			connection = PG.connect(dbname: 'chitter_test')
		end
		result = connection.exec("SELECT * FROM peeps;")
		result.map { |peep| Peep.new(peep['message']) }
	end
	def self.create(message:)
		if (ENV["ENVIRONMENT"] == 'test')
			connection = PG.connect(dbname: 'chitter')
		else 
			connection = PG.connect(dbname: 'chitter_test')
		end
		result = connection.query("INSERT INTO peeps(message) VALUES('#{message}') RETURNING id, message;")
		result = result.map { |peep| peep }
		Peep.new(result[0]['message'])
	end
end