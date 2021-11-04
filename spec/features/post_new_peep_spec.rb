feature 'Adding new peep' do
  scenario 'includes new peep' do
    visit('/all_peeps')
    fill_in :message, with: 'new peep'
    click_button 'Add'
    expect(page).to have_content 'new peep'
  end
 end

