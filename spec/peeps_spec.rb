require 'peeps'

describe Peeps do

  describe '#all' do
    it 'returns list of all names and messages' do
      add_row_to_test_database
      expect(Peeps.all.first.message).to eq("This is a peep!")
    end
  end

  describe '#add' do
    before :each do
      Peeps.add('This is a new test peep')
    end

    it 'adds message to peeps db table' do
      expect(Peeps.all.first.message).to eq("This is a new test peep")
    end

    it 'adds date to peeps db table' do
      expect(Peeps.all.first.date).to eq(Time.now.strftime("%Y-%m-%d"))
    end
  end

  describe '#filter' do
    it 'displays all peeps containing a certain search phrase' do
      Peeps.add("This is peep one")
      Peeps.add("This is peep two")

      result = Peeps.filter("one")

      expect(result.first.message).to eq("This is peep one")
    end
  end
end
