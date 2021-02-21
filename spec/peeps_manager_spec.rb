require 'peeps_manager'

describe PeepsManager do
  describe '.all' do
    it 'returns a list of peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('This is another peep');")
      connection.exec("INSERT INTO peeps (message) VALUES('Yet another peep');")

      peeps = PeepsManager.all

      expect(peeps).to include('This is a peep')
      expect(peeps).to include('This is another peep')
      expect(peeps).to include('Yet another peep')
    end
  end
  describe '.create' do
    it 'can add peeps with .create' do

      # Add the test data
      PeepsManager.create('Mad new peep')

      peeps = PeepsManager.all

      expect(peeps).to include('Mad new peep')
    end
  end
end