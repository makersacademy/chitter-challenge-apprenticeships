feature 'adding messages' do
    scenario 'user can add a new comment' do
        visit('/new')
        fill_in('message', with: "Hello friends")
        click_button 'Submit'
        expect(page).to have_content "Hello friends"
      end


end