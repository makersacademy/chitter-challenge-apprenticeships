# in spec/bookmark_spec.rb

require 'message'

describe Message do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Message.all

      expect(peeps).to include("This is a peep!")
    end
  end
end