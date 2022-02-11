require 'chitter_manager'

describe ChitterManager do

  describe '.all' do
    it 'returns a list of all messages' do
      peeps = ChitterManager.all

      expect(peeps).to include("Hey there it's Friday")
    end
  end
  
end
