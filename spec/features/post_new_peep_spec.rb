require 'date'
feature 'Adding new peep' do
  $peeps = Peeps.new(
    [
      Peep.new("This is a peep!", (Date.today).strftime("%Y-%m-%d")),
      Peep.new("This is a peep!", (Date.today - 1).strftime("%Y-%m-%d")),
      Peep.new("This is a peep!", (Date.today - 2).strftime("%Y-%m-%d")),
    ]
  )
  scenario 'includes new peep' do
    visit('/all_peeps')
    fill_in :message, with: 'new peep'
    click_button 'Add'
    expect(page).to have_content 'new peep'
  end
end
