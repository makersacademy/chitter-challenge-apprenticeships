require 'domain/peep'

describe Peep do
  let(:subject) { described_class.new("I am a peep", DateTime.new(2021, 10, 15), 1) }
  describe '#initalize' do 
    it 'peeps is created with random id, some content and a timestamp' do
      expect(subject.id).to eq 1
      expect(subject.message).to eq "I am a peep"
      expect(subject.time_stamp).to eq DateTime.new(2021, 10, 15)
    end    
  end

  describe '#==' do
    it 'two peeps are the same if the ID matches' do
      peep2 = Peep.new("I'm a peep!", DateTime.new(2021, 10, 15), 1)
      expect(subject).to eq peep2
    end
    it 'two peeps are not the same if they have different ids' do
      peep2 = Peep.new("I'm a peep!", DateTime.new(2021, 10, 15), 2)
      expect(subject == peep2).to eq false
    end
    it 'a peep and an object that is not a peep returns false' do
      peep2 = String.new("Hello I am not a peep")
      expect(subject == peep2).to eq false
    end
  end
end
