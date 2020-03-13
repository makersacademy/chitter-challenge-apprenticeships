feature "adding a new peep" do
  scenario "a user can add a peep to Chitter" do
    visit('/new')
    fill_in('message', with: 'This is a peep!')
    click_button('Submit')
    expect(page).to have_content('This is a peep!')
  end
end
