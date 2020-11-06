require 'peep'

RSpec.describe Peep do
  peeps = Peep.all
  peep_message = peeps.map { |peep| peep[:message] }

  it 'returns peeps from database' do
    expect(peep_message).to include 'This is a test peep!'
  end

  describe 'add peeps' do
    Peep.add('My new peep using rspec.')
    peeps = Peep.all
    peep_message = peeps.map { |peep| peep[:message] }
    peep_date = peeps.map { |peep| peep[:date] }

    it 'adds new peeps to database' do
      expect(peep_message).to include 'My new peep using rspec.'
    end

    it 'adds dates to database' do
      expect(peep_date).to include Date.today.strftime
    end
  end
end
