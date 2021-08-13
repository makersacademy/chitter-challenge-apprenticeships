require 'peep'

describe Peep do
  it "returns all the peeps" do

   
    connection = PG.connect(dbname: 'chitter_test')
  
      # Add the test data
    connection.exec("INSERT into peeps (message) VALUES ('first peep');")
    connection.exec("INSERT into peeps (message) VALUES ('second peep');")
    connection.exec("INSERT into peeps (message) VALUES ('third peep');")

    


    

    peeps = Peep.all

    #atm we are running test database which empties everytime we run a test


    
    expect(peeps).to include("first peep")
    expect(peeps).to include("second peep")
    expect(peeps).to include("third peep")
  end

end