require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns a list of peeps' do
      Peeps.create(message: "Test")
    end
  end
end