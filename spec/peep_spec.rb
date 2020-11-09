require 'peep'

describe Peep do
  
  describe '#self.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('And this is a peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('And this is a peep too!');")

      peeps = Peep.all

      expect(peeps.first.peep).to eq "This is a peep!"
      expect(peeps[1].peep).to eq "And this is a peep!"
      expect(peeps[2].peep).to eq "And this is a peep too!"
    end
  end

  describe '#self.add' do
    it 'adds a new peep' do
      Peep.add(peep: 'Test peep', time: Time.now)

      expect(Peep.all.first.peep).to eq "Test peep"
      expect(Peep.all.first.time).to eq "#{Time.now}"
    end
  end

end