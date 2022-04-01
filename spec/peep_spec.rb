require 'peep'
require 'peepviewer'

RSpec.describe Peep do
  it 'returns the message and date of the peep' do
    peep_entry = PeepViewer.add(message: 'New peep')
    todays_date = Date.today.to_s
    first_entry = PeepViewer.all.first

    expect(first_entry.id).to eq peep_entry.id
    expect(first_entry.message).to eq 'New peep'
    expect(first_entry.date).to eq todays_date
  end
end