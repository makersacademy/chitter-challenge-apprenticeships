require 'peep'
require 'database_connection'
require 'pg'



describe '.all' do

	it 'returns all peeps' do
		DatabaseConnection.query("INSERT INTO peeps (message) values ('This is a peep!');")
		peeps = Peep.all
		expect(peeps.length).to eq 1
		expect(peeps.first.message).to eq 'This is a peep!'
	end

		it 'returns them in reverse chronological order' do
			DatabaseConnection.query("INSERT INTO peeps (message) values ('This is a peep!');")
			DatabaseConnection.query("INSERT INTO peeps (message) values ('This is a later peep!');")
			peeps = Peep.all
			
			expect(peeps.first.message).to eq 'This is a later peep!'
			expect(peeps.last.message).to eq 'This is a peep!'
		end
end

describe '.create' do

	it 'creates a new peep' do
		message = 'blabla'
		peep = Peep.create(message)
		expect(peep).to be_a Peep
		expect(peep.message).to eq 'blabla'
	end
end

describe '.search' do
	it 'searches for peeps by a keyword' do
		peep1 = Peep.create('Foxes are great')
		peep2 = Peep.create('Foxes are the best animals!')
		peep3 = Peep.create('I want a pet tiger instead.')

			results = Peep.search('Foxes')
			expect(results.length).to eq 2

			list_of_results = []

			results.each do |result| list_of_results.append(result.message)	end
			expect(list_of_results).to include(peep1.message)
			expect(list_of_results).to include(peep2.message)
			expect(list_of_results).not_to include(peep3.message)
	end
end