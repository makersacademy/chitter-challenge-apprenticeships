require 'peeps'

describe Peeps do
  describe '#all' do
    it 'returns all peeps' do
      peep = Peeps.create(peep: 'This is a peep!')
      Peeps.create(peep: 'This is another peep!')
      Peeps.create(peep: 'This is a third peep!')
      peeps = Peeps.all

      expect(peeps.length).to eq(3)
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq peep.id
      expect(peeps.first.peep).to eq "This is a peep!"
      expect(peeps.first.date).to eq Time.now.strftime("%Y-%m-%d")
    end

    it 'creates a peep' do
      peep = Peeps.create(peep: 'This is a peep!')
      expect(peep).to be_a Peeps
      expect(peep.peep).to eq 'This is a peep!'
      expect(peep.date).to eq Time.now.strftime("%Y-%m-%d")
    end
  end
end
