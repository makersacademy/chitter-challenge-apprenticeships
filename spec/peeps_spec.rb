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
  end

  describe "#add" do
    it "creates new peep" do
      peep = Peep.add('test peep', '2020-11-09')
      expect(peep).to be_a Peep
      expect(peep.message).to eq "test peep"
      expect(peep.posttime).to eq '2020-11-09'
    end
  end
end
