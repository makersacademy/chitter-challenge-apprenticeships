require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      today_date = Time.now.strftime('%Y-%m-%d')

      expect(peeps[0]).to be_a Peep
      expect(peeps[1]).to be_a Peep
      expect(peeps[0].message).to eq 'This is a test peep!'
      expect(peeps[1].message).to eq 'This is another test peep!'
      expect(peeps[0].date).to eq today_date
      expect(peeps[1].date).to eq today_date
    end
  end

  describe '.create' do
    it 'adds a new peep to the database' do
      new_peep = 'I created a test peep!'
      Peep.create(new_peep)
      peeps = Peep.all

      expect(peeps[-1].message).to eq new_peep
    end
  end
end
