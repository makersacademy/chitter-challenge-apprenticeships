require './lib/peeps'

describe Peeps do
  let(:time) { double :time}

  describe '#all' do
    it 'should return a list of peeps' do
      Peeps.create('This is a peep!')
      time = Time.now
      peeps = Peeps.all

      expect(peeps[0].message).to include('This is a peep!')
    end
  end

  describe '#create' do
    it 'should add a new peep' do
      Peeps.create('This is a peep!')
      peeps = Peeps.all
      expect(peeps[0].message).to include('This is a peep!')
    end
  end
end