feature 'Posting a tweet' do
  scenario 'A user can post a tweet to the timeline' do
    visit('/tweets/new')
    fill_in('user_id', with: 1)
    fill_in('message', with: 'Test tweet')
    click_button('Submit')

    expect(page).to have_content(1)
    expect(page).to have_content('Test tweet')

  end
end