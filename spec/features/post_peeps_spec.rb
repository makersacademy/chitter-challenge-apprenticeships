feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    visit('/chitter')
    click_button('My Peeps')
    click_button('New Peep')
    fill_in('message', with: 'I am posting for the first time!')
    click_button('Post')

    expect(page).to have_content 'I am posting for the first time!'
  end
end