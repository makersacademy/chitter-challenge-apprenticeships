require 'pg'
require 'peeps'

describe Peep do

  describe '#all' do
    it 'lists all the peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      connection.exec("INSERT INTO peeps (message) VALUES ('This is my first peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is my second peep!');")
      connection.exec("INSERT INTO peeps (message) VALUES ('This is my third peep!');")

      peeps_list = Peep.all

      expect(peeps_list).to include "This is my first peep!"
      expect(peeps_list).to include "This is my second peep!"
      expect(peeps_list).to include "This is my third peep!"

    end
  end

  describe '#create' do
    it 'creates a new peep' do
      new_peep = Peep.create(message: 'Here is a new peep')
      peeps_list = Peep.all

      expect(peeps_list).to include "Here is a new peep"
    end
  end
  
end