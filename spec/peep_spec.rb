require 'peep'

describe Peep do
  it "returns all the peeps" do

    


    

    peeps = Peep.all

    #atm we are running test database which empties everytime we run a test


    
    expect(peeps).to include("hi")
    expect(peeps).to include("how r u")
    expect(peeps).to include("bye")
  end

end