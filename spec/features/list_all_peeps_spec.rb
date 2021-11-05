feature 'Listing all peeps page' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", '15Oct'),
      Peep.new("This is a peep!", '14Oct'),
      Peep.new("This is a peep!", '13Oct'),
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

