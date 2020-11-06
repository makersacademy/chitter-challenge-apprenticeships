require_relative '../lib/peeps'
describe Peep do

  describe '.all' do
    it "returns all peeps" do
      peeps = Peep.all
      expect(peeps.length).to eq 1
      expect(peeps.first).to be_a Peep
      expect(peeps.first.id).to eq peeps[0].id
      expect(peeps.first.message).to eq 'This is a peep!'
      expect(peeps.first.posttime).to eq '2020-11-09'
    end
    it "returns peeps in reverse chronological order" do
      Peep.add('peep1', '2020-11-09')
      Peep.add('peep2', '2020-11-08')
      Peep.add('peep3', '2020-11-07')
      peeps = Peep.all

      expect(peeps[1].message).to eq 'peep1'
      expect(peeps[2].message).to eq 'peep2'
      expect(peeps[3].message).to eq 'peep3'
    end
  end

  describe "#add" do
    it "creates new peep" do
      peep = Peep.add('test peep', '2020-11-09')
      expect(peep).to be_a Peep
      expect(peep.message).to eq "test peep"
      expect(peep.posttime).to eq '2020-11-09'
    end
  end
  describe "#filter" do
    it "filters thorugh messages by words" do
      Peep.add('peep1', '2020-11-09')
      Peep.add('peep2', '2020-11-08')
      Peep.add('peep3', '2020-11-07')
      
      expect(Peep.filter("peep1")[0].message).to eq 'peep1'
      expect(Peep.filter("peep2")[0].message).to eq 'peep2'
      expect(Peep.filter("peep")[3].message).to eq 'peep3'
    end
  end
end
