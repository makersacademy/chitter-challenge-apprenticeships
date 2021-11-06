require 'date'
feature 'Listing all peeps page' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", Date.today.strftime("%Y-%m-%d")),
      Peep.new("This is a peep!", (Date.today - 1).strftime("%Y-%m-%d")),
      Peep.new("This is a peep!", (Date.today - 2).strftime("%Y-%m-%d")),
    ]
  )
  scenario 'has headers' do
    visit('/all_peeps')
    expect(page).to have_content "Peep"
  end
  scenario 'lists all peeps' do
    visit('/all_peeps')
    expect(page).to have_content "This is a peep!"
  end
end
