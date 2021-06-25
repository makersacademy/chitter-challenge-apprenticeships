require 'pg'

feature 'Post a message' do
    scenario 'User can post a message' do
        visit('/new')
        fill_in('message', with: 'This is another message')
        click_button('submit')
        expect(page).to have_content('This is another message')
    end
end