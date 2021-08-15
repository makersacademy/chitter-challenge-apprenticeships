require_relative '../../lib/peeps.rb' #Check the syntax on this

describe Peeps do 
  describe '#all_peeps' do 
    before do 
      peep_date = Time.new
      peep_date = peep_date.strftime("%Y-%m-%d") #Date MUST be formatted like this, SQL doesn't like it other than YYYY-MM-DD with '-' not '/'
      conn = PG.connect(dbname: 'chitter_test')
      conn.exec("INSERT INTO peeps (message, peep_date) VALUES ('Test peep for Unit test 1.', '#{peep_date}');") #Check if this is values or value
    end 

    it 'should return a list of all peeps stored in the DB' do 
      peep_date = Time.new # DRY this out / alter the scope
      peep_date = peep_date.strftime("%Y-%m-%d")

      first_peep = Peeps.all_peeps
      expect(first_peep.first.peep_text).to include("Test peep for Unit test 1.") #What is .first and why does it work with the ORM?
      expect(first_peep.first.peep_date).to include("#{peep_date}")
    end
  end 

  describe '#new_peep' do 
    it 'should store the new peep in the table' do 
      peep_date = Time.new # DRY this out / alter the scope
      peep_date = peep_date.strftime("%Y-%m-%d")
      
      temp = Peeps.new_peep(peep_text: "Test peep for Unit test 2")

      unit_test_2 = Peeps.all_peeps
      expect(unit_test_2.first.peep_text).to include("Test peep for Unit test 2")
      expect(unit_test_2.first.peep_date).to include("#{peep_date}")
    end 
  end 
end 