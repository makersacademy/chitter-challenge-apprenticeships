feature 'Date of Peep' do
  scenario 'A user can see the date of a message' do
    visit('/chitter/new')
    fill_in('message', with: 'Weekend Party!')
    click_button('Post')

    expect(page).to have_content "Weekend Party!"
    expect(page).to have_content Date.today
  end
end
