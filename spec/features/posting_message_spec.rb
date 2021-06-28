feature 'Posting a new message' do
    scenario 'A user can post a message to Chitter' do
      visit('/messages/new')
      fill_in('message', with: 'It is the weekend!')
      click_button('Post')
  
      expect(page).to have_content 'It is the weekend!'
    end
end