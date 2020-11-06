require 'chitter'

RSpec.describe Peeps do
  before [:each] do
    @peep = Peeps.post(cheep: 'This is my first test')
    Peeps.post(cheep: 'I have decided to run another test!')
    Peeps.post(cheep: 'Hopefully this test is added too')
  end
  describe 'new' do
    it 'makes a new instance of peeps setting the id' do
      peeps = Peeps.all
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.id).to eq @peep.id
    end
    it 'makes a new instance of peeps setting the message' do
      peeps = Peeps.all
      expect(peeps.first.message).to eq 'This is my first test'
    end
    it 'makes a new instance of peeps setting the new' do
      peeps = Peeps.all
      expect(peeps.first.date).to include("-")
    end
  end

  describe 'all' do
    it 'returns all of the peeps made so far' do
      peeps = Peeps.all
      expect(peeps.length).to eq 3
    end
  end

  describe 'post' do
    it 'adds a peep to the database' do
      Peeps.post(cheep: 'Testing, testing, 1 2 3')
      peeps = Peeps.all
      expect(peeps.length).to eq 4
    end
  end
end
