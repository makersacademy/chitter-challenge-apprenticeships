require 'peep'

describe Peep do 
	 describe '.view_all' do 
 		 it 'returns all peeps that were posted' do 
  			 connection = PG.connect(dbname: 'chitter_test')

  			
      connection.exec("INSERT INTO peeps (message) VALUES ('Thinking about what to have for dinner');")
      connection.exec("INSERT INTO peeps (message) VALUES('Please share what books you are reading atm');")
      connection.exec("INSERT INTO peeps (message) VALUES('HELLEW!');")

  			 peeps = Peep.view_all

  			 expect(peeps).to include('Thinking about what to have for dinner')
  			 expect(peeps).to include('Please share what books you are reading atm')
  			 expect(peeps).to include('HELLEW!')
  		end
 	end
end
