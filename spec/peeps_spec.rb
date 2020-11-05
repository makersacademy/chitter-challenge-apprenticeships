require 'peeps'

describe Peeps do

  describe '#all' do
    it 'returns list of all names and messages' do
      add_row_to_test_database
      expect(Peeps.all.first.message).to eq("This is a peep!")
    end
  end

  describe '#add' do
    it 'adds message to peeps db table' do
      Peeps.add('This is a new test peep')
      expect(Peeps.all.first.message).to eq("This is a new test peep")
    end

    it 'adds date to peeps db table' do
      Peeps.add('This is a new test peep')
      expect(Peeps.all.first.message).to eq("This is a new test peep")
      expect(Peeps.all.first.date).to eq(Time.now.strftime("%Y-%m-%d"))
    end
  end
end
