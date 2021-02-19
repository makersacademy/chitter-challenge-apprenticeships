require 'peep'

describe Peep do
  describe '.all' do
    it 'prints to the browser all the messages' do
        peeps = Peep.all

        expect(peeps).to include("Pizza burned the inside of my mouth and I really don't understand why the things I love keep hurting me.")
        expect(peeps).to include("I need a room full of mirrors so I can be surrounded by winners")
        expect(peeps).to include("Caffeine doesn't do it anymore I need someone to text me 'We need to talk'")
    end
  end
end