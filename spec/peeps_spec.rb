# in spec/peeps_spec.rb

require 'peeps'

describe Peeps do
  describe '.all' do
    it 'returns all peeps' do
      connection = PG.connect(dbname: 'chitter_test')

      # Add the test data
      connection.exec("INSERT INTO peeps VALUES(1, 'Just completed SQL Zoo. It was fun to do!');")
      connection.exec("INSERT INTO peeps VALUES(2, 'Testing adding chitter messages');")
      connection.exec("INSERT INTO peeps VALUES(3, 'testing chitter.');")
  

      peeps = Peeps.all

      expect(peeps).to include "Just completed SQL Zoo. It was fun to do!"
      expect(peeps).to include "Testing adding chitter messages"
      expect(peeps).to include "testing chitter."
      end
    end
  end


    


