require "peep"

describe Peep do
  describe "all" do
    it "returns all peeps" do

    #  connection = PG.connect(dbname: 'chitter_test')

     peep = Peep.add(message: 'This is a peep!')
     Peep.add(message: 'This is a peep too!')
     Peep.add(message: 'This is another peep!')
     Peep.add(message: 'This is just a peep!')

      peeps = Peep.all
      current_time = Time.now
      time = current_time.strftime("%F %T")

      expect(peeps.length).to eq 4
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.message).to eq 'This is a peep!'
      expect(peeps.first.time).to eq time

    end
  end

  describe "add" do
    it "add a new peep" do
      peep = Peep.add(message: "Hello Peeps, This is my first peep!")
      current_time = Time.now
      time = current_time.strftime("%F %T")
      presisted_data = PG.connect(dbname: 'chitter_test').query("SELECT * FROM peeps WHERE id=#{peep.id};")

    expect(peep).to be_a Peep
    expect(peep.id).to eq presisted_data.first['id']
    expect(peep.message).to eq "Hello Peeps, This is my first peep!"
    expect(peep.time).to eq time
    end
  end
end
