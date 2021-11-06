require 'date'
feature 'Listing all peeps page' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", Date.today.strftime("%Y-%m-%d")),
      Peep.new("This is a peep!", Date.today.strftime("%Y-%m-%d")),
      Peep.new("This is a peep!", Date.today.strftime("%Y-%m-%d")),
    ]
  )
  scenario 'has headers' do
    visit('/all_peeps')
    expect(page).to have_content Date.today.day
  end
end
