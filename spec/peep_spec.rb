require 'peep'

describe Peep do 
	it 'creates new peep' do 
		peep = Peep.new('Friday is for losers', '01.03.2020')
		expect(peep.message).to eq 'Friday is for losers'
		expect(peep.date).to eq '01.03.2020'
	end
	it 'returns an array of peeps objects' do 
		expect(Peep.all.class). to eq Array
	end
end