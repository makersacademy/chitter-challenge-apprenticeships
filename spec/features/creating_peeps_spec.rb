feature 'Create peep' do
  scenario 'Should create and add a new peep to the chitter database' do
    visit('/create-peep')
    page.fill_in('message', with: 'Chitter is the best!')
    page.fill_in('username', with: 'ChitterUser2021')
    page.click_button('Submit')
    expect(page).to have_current_path('/peeps')
    expect(page).to have_content('Chitter is the best!')
  end
end