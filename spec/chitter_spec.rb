require 'chitter_manager'

describe ChitterManager do

  describe '.all' do
    it 'returns a list of all messages' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('Hey there it''s Friday');")
      connection.exec("INSERT INTO peeps (message) VALUES ('Fri-Yay!');")

      peeps = ChitterManager.all

      expect(peeps).to include("Hey there it's Friday")
      expect(peeps).to include("Fri-Yay!")
    end
  end

end
