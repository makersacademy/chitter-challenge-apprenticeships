require 'peep'

describe Peep do
  describe '#all' do
    it 'returns a peep' do
      DatabaseConnection.query("INSERT INTO peeps(message) VALUES('This is a peep');")

      peeps = Peep.all
      peep = peeps.first

      expect(peep.message).to eq 'This is a peep'
    end
  end

  describe "#format_date" do
    it 'formats the date in the correct format' do
      date = Peep.format_date('2021-10-14')
      expect(date).to eq '14/10/21'
    end
  end
end
