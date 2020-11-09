require 'peep'

describe Peep do

  describe '.all' do
    it 'displays all of the messages' do
      Peep.write(message: 'Hello there')
      Peep.write(message: 'Another peep')
      Peep.write(message: 'And another')
      peeps = Peep.all
      expect(peeps.first.message).to eq ('And another')
      expect(peeps.length).to eq 3
    end

    it 'orders the messages in reverse chronological order' do
      Peep.write(message: 'I wrote this first')
      Peep.write(message: 'I wrote this last')
      peeps = Peep.all
      expect(peeps.first.message).to eq ('I wrote this last')
    end
  end

  describe '.write' do
    it 'writes a peep' do
      Peep.write(message: 'A peep')
      peeps = Peep.all
      expect(peeps.first.message).to eq ('A peep')
    end
  end

end
