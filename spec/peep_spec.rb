require 'peep'

describe Peep do

  describe '.all' do
    it 'shows all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!')")

      peeps = Peep.all
      expect(peeps).to include("This is a peep!")
      
    end
  end

  describe '.create' do
    it 'posts a new peep' do
      Peep.create(message: "Thinking of something funny to peep")
      expect(Peep.all).to include "Thinking of something funny to peep"
    end
  end
end
