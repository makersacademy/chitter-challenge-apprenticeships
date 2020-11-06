feature "New Peeps" do
  scenario "add new peep and confirm" do
    visit '/new'
    fill_in 'new_peep', with: 'My new peep.'
    click_on 'Add'
    expect(page).to have_content('Your new peep has been sent.')
    click_on 'OK'
    expect(page).to have_content('My new peep.')

  end
end
