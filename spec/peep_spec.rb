require 'peep'

describe Peep do
  it "returns all the peeps" do

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT into peeps (message) VALUES ('hi');")
    connection.exec("INSERT into peeps (message) VALUES ('how r u');")
    connection.exec("INSERT into peeps (message) VALUES ('bye');")


    

    peeps = Peep.all

    #atm we are running test database which empties everytime we run a test


    
    expect(peeps).to include("hi")
    expect(peeps).to include("how r u")
    expect(peeps).to include("bye")
  end

end