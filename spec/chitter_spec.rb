require 'chitter_manager'

describe ChitterManager do

  describe '.all' do
    it 'returns a list of all messages' do
      connection = PG.connect(dbname: 'chitter_test')
      ChitterManager.post(message: 'This is my first peep')

      peeps = ChitterManager.all

      expect(peeps[0]).to be_a ChitterManager
    end
  end

  describe '.post' do
    it 'creates a new post' do
      chitter = ChitterManager.post(message: 'This is my first peep')
      
      expect(chitter).to be_a ChitterManager
      expect(chitter.message).to eq 'This is my first peep'
      expect(DateTime.parse(chitter.date)).to be_an_instance_of(DateTime)

    end
  end
  
end
