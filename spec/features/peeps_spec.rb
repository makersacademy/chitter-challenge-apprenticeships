require_relative '../../lib/peeps.rb' #Check the syntax on this

describe Peeps do 
  describe '#all_peeps' do 
    it 'should return a list of all peeps stored in the DB' do 
      conn = PG.connect(dbname: 'chitter_test')
      conn.exec("INSERT INTO peeps (message, peep_date) VALUES ('Test peep for Unit test 1.', '2021-08-14');") #Check if this is values or value

      first_peep = Peeps.all_peeps

      expect(first_peep.first.peep_text).to include("Test peep for Unit test 1.") #What is .first and why does it work with the ORM?
      expect(first_peep.first.peep_date).to include("2021-08-14")
    end
  end 

  describe '#new_peep' do 
    it 'should store the new peep in the table' do 
      conn = PG.connect(dbname: 'chitter_test')
      conn.exec("INSERT INTO peeps (message) VALUES ('Test newly stored peep for Unit test 2')")

      peep = Peeps.all_peeps
      expect(peep).to include("Test newly stored peep for Unit test 2")
    end 
  end 
end 