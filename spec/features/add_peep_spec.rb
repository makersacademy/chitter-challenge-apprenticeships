feature 'add peep' do
  scenario 'adding a peep to the webpage' do
    visit('/peeps/add')
    fill_in('message', with: 'Adding a peep')
    click_button 'Submit'
    expect(page).to have_content('Adding a peep')
  end
end
