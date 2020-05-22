require './lib/chitter_db.rb'

describe Peeps do 
  it "should be an instance of itself" do
    chitter = Peeps.new(id:1, message:"hello")
    expect(chitter).to be_instance_of Peeps
  end

  describe ".all" do
    it "should show all mesages" do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO Chitter (message) VALUES ('hello');")
      connection.exec("INSERT INTO Chitter (message) VALUES('I see');")
      connection.exec("INSERT INTO Chitter (message) VALUES('noooooo');")
  
      chitter = Peeps.all
  
      expect(chitter).to include('hello')
      expect(chitter).to include('I see')
      expect(chitter).to include('noooooo')
    end 
  end
end