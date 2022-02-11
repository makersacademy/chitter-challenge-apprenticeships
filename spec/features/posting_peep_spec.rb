feature 'Posting a peep' do
  scenario 'A user can post a peep' do
    visit('/newsfeed')
    fill_in('message', with: 'Test peep!')
    click_button('Submit')

    expect(page).to have_content('Test peep!')
  end
end
