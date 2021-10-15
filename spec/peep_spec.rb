require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      Peep.add(message: 'message 123')
      Peep.add(message: 'message 321')

      peeps = Peep.all

      expect(peeps).to include('message 123')
      expect(peeps).to include('message 321')
    end
  end

  describe '.add' do
    it 'adds a peep to the database' do
      Peep.add(message: 'message ABC')

      expect(Peep.all).to include('message ABC')
    end
  end
end