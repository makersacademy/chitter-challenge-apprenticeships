require 'peep'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      Peep.create(message: "Test")
    end
  end
end