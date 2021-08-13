require 'database_helpers'
require 'peep'
require 'time'

describe Peep do
  describe '.all' do
    it 'returns a list of peeps' do
      if ENV['ENVIRONMENT'] == 'test'
        connection = PG.connect(dbname: 'chitter_test')
      else
        connection = PG.connect(dbname: 'chitter')
      end
      result = connection.exec("SELECT * FROM peeps")
      result.map do |peep|
        Peep.new(id: peep['id'], message: peep['message'], date: peep['date'])
      end
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      date = Time.new
      peep = Peep.create(message: 'Hello Chitter')
      persisted_data = persisted_data(id: peep.id)
      expect(peep.message).to eq 'Hello Chitter'
      expect(peep.date).to eq(date.strftime("%m/%d/%Y at %H:%M"))
    end
  end
end