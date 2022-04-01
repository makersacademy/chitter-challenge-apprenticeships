require 'little_chits'

describe Chits do

  describe '.all' do
    
    it 'shows all chits' do
      connection = PG.connect(dbname: 'chitter_test')
      
      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('Chit One');")
      connection.exec("INSERT INTO peeps (message) VALUES('Chit Two');")

      all_chits = Chits.all

      expect(all_chits).to include("Chit One")
      expect(all_chits).to include("Chit Two")
    end
    
  end

end