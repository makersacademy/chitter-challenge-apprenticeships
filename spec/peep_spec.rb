require 'peep'

describe Chitter do
  describe '.all' do 
    it 'returns all peeps' do 
      ENV['ENVIRNOMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('test_peep_1') ;")
      connection.exec("INSERT INTO peeps (message) VALUES ('test_peep_2') ;")
      connection.exec("INSERT INTO peeps (message) VALUES ('test_peep_3') ;")

      peeps = Peep.all 

      expect(peeps).to include("test_peep_1")
      expect(peeps).to include("test_peep_2")
      expect(peeps).to include("test_peep_3") 
    end 
  end

  describe '.create' do
    it 'allows user to create a peep' do
    ENV['ENVIRNOMENT'] = 'test'
    Peep.create(peep:"test_peep")
    peeps = Peep.all 


      expect(peeps).to include("test_peep")
    end 
  end
end