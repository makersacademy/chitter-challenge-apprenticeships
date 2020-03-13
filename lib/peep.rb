require "pg"

class Peep 
	attr_reader :message, :date
	def initialize(message, date = '')
		@message = message
		@date = date
	end
	def self.all 
		if (ENV["ENVIRONMENT"] == 'test')
			connection = PG.connect(dbname: 'chitter_test')
		else 
			connection = PG.connect(dbname: 'chitter')
		end
		result = connection.exec("SELECT * FROM peeps ORDER BY id DESC;")
		result.map { |peep| Peep.new(peep['message'], peep['date']) }
	end

	def self.create(message:, date:)
		if (ENV["ENVIRONMENT"] == 'test')
			connection = PG.connect(dbname: 'chitter_test')
		else 
			connection = PG.connect(dbname: 'chitter')
		end
		result = connection.query("INSERT INTO peeps(message, date) VALUES('#{message}', '#{date}') RETURNING id, message, date;")
		result = result.map { |peep| peep }
		Peep.new(result[0]['message'])
	end

	def self.search(keywords)
		if (ENV["ENVIRONMENT"] == 'test')
			connection = PG.connect(dbname: 'chitter_test')
		else 
			connection = PG.connect(dbname: 'chitter')
		end
		result = connection.exec("SELECT * FROM peeps WHERE message LIKE '%#{keywords}%'ORDER BY id DESC;")
		result.map { |peep| Peep.new(peep['message'], peep['date']) }
	end
end