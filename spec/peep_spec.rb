require 'peep'

describe Peep do
  describe '.all' do
    it 'returns all peeps' do
      peeps = Peep.all
      messages = peeps.map { |peep| peep.message }
      

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peep
      expect(messages).to include 'This is a test peep!'
      expect(messages).to include 'This is another test peep!'
      expect(messages).to include 'This is an old peep'
    end
  end

  describe '.create' do
    it 'adds a new peep to the database' do
      new_message = 'I created a test peep!'

      Peep.create(new_message)
      peeps = Peep.all
      messages = peeps.map { |peep| peep.message }

      expect(messages).to include new_message
    end
  end

  describe '.filtered' do
    it 'returns only peeps with keyword' do
      keyword = 'test'
      
      peeps = Peep.filtered(keyword)
      messages = peeps.map { |peep| peep.message }

      expect(messages).to include 'This is a test peep!'
      expect(messages).to include 'This is another test peep!'
      expect(messages).to_not include 'This is an old peep'
    end
  end

end
