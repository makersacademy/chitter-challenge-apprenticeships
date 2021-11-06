require 'date'
feature 'Listing all peeps page' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", Date.today),
      Peep.new("This is a peep!", Date.today - 1),
      Peep.new("This is a peep!", Date.today - 2),
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
