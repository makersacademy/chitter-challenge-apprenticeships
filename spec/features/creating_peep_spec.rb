feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter feed' do
    visit('/peeps/new')
    fill_in('message', with: 'This is a new peep!')
    click_button('Submit')

    expect(page).to have_content 'This is a new peep!'
  end
end