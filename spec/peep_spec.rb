require 'peep'

describe Peep do 
	describe '.show_all' do 
		it 'returns all messages posted' do 
			connection = PG.connect(dbname: 'chitter_test')

			
    	connection.exec("INSERT INTO peeps (message) VALUES ('Its fun here on chitter');")
    	connection.exec("INSERT INTO peeps (message) VALUES('Come on chitter to have great banter');")
    	connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")

			peeps = Peep.show_all

			expect(peeps).to include('Its fun here on chitter')
			expect(peeps).to include('Come on chitter to have great banter')
			expect(peeps).to include('This is a peep!')
		end
	end
	describe '.compose' do 
		it 'allows user to compose a new peep' do 
			Peep.compose(message: 'TGIF!! Thank God its FriYAY!')

			expect(Peep.show_all).to include 'TGIF!! Thank God its FriYAY!'
		end
	end
end