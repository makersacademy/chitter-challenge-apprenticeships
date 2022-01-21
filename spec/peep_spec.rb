require 'peep'

describe Peep do

  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')
      connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")

      peeps = Peep.all

      expect(peeps[0].message).to include 'This is a peep!'
    end
  end

  describe '.create' do
    it 'stores a peep in the database' do
      Peep.create(message: "This is a peep")
      peeps = Peep.all
      expect(peeps[0].message).to include 'This is a peep'
    end
  end
end
