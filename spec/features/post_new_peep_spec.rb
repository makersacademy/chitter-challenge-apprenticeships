feature 'Adding new peep' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", '15Oct'),
      Peep.new("This is a peep!", '14Oct'),
      Peep.new("This is a peep!", '13Oct'),
    ]
  )
  scenario 'includes new peep' do
    visit('/all_peeps')
    fill_in :message, with: 'new peep'
    click_button 'Add'
    expect(page).to have_content 'new peep'
  end
end
