feature 'Posting a new peep' do
  scenario 'A user can post a message' do
    visit('/peeps') 
    fill_in('message', with: 'Funny how the more we are home the more homeless we look')
    click_button('Post')

    expect(page).to have_content 'Funny how the more we are home the more homeless we look'
  end
end