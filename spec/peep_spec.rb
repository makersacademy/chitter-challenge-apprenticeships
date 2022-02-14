require 'peep'
require 'date'

describe Chitter do
  describe '.all' do 
    it 'returns all peeps' do 
      ENV['ENVIRNOMENT'] = 'test'
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) VALUES ('test_peep_1') ;")
      connection.exec("INSERT INTO peeps (message) VALUES ('test_peep_2') ;")
      connection.exec("INSERT INTO peeps (message) VALUES ('test_peep_3') ;")

      peeps = Peep.all 

      expect(peeps).to include("test_peep_1 - " + Date.today.to_s)
      expect(peeps).to include("test_peep_2 - " + Date.today.to_s)
      expect(peeps).to include("test_peep_3 - " + Date.today.to_s) 
    end 
  end

  describe '.create' do
    it 'allows user to create a peep' do
    ENV['ENVIRNOMENT'] = 'test'
    Peep.create(peep:"test_peep")
    peeps = Peep.all 


      expect(peeps).to include("test_peep - " + Date.today.to_s)
    end 
  end
end