require_relative '../lib/peeps'
describe Peep do
  describe '.all' do
    it "returns all peeps" do
      peeps = Peep.all
      expect(peeps.length).to eq 1
     expect(peeps.first).to be_a Peep
     expect(peeps.first.id).to eq peeps[0].id
     expect(peeps.first.message).to eq 'This is a peep!'
   end
  end
end
