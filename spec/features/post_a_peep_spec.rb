feature 'post a peep' do
  scenario 'the user can post a peep' do
    visit('/')
    fill_in('peep', with: "I posted a peep!")
    click_button('Peep!')
    expect(page).to have_content "I posted a peep!"
  end
end
