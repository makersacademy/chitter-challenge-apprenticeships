require "./lib/peep.rb"

describe Peep do  
  it "should create an instance of itself" do 
    peeps = Peep.new
    expect(peeps).to be_instance_of Peep
  end

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      Peep.create(message: 'You are jelly to my burger. My point is, you are worthless.')
      Peep.create(message: 'Alexa, skip to Friday')
      Peep.create(message: 'You look happier')

      peeps = Peep.all

      expect(peeps).to include('You are jelly to my burger. My point is, you are worthless.')
      expect(peeps).to include('Alexa, skip to Friday')
      expect(peeps).to include('You look happier')
    end

    # it 'show date of peeps'
    # connection = PG.connect(dbname: 'chitter_test')

    #   Peep.create(message: 'You are jelly to my burger. My point is, you are worthless.')
    #   Peep.create(message: 'Alexa, skip to Friday')
    #   Peep.create(message: 'You look happier')

    #   peeps = Peep.all

    #   expect(peeps).to include('You are jelly to my burger. My point is, you are worthless.')
    #   expect(peeps).to include('Alexa, skip to Friday')
    #   expect(peeps).to include('You look happier')
    # end

  end

  describe '.create' do
    it 'creates a new peep' do
      Peep.create(message: 'LMNOP is truly the party zone of the alphabet.')
  
      expect(Peep.all).to include 'LMNOP is truly the party zone of the alphabet.'
    end
  end
end
