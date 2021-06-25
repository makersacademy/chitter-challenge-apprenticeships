require 'pg'

feature 'View messages' do
    scenario 'User can view messages' do
        Message.create(message: 'This is my first message!')
        Message.create(message: 'This is my second message!')
        visit('/messages')
        expect(page).to have_content('This is my first message!')
        expect(page).to have_content('This is my second message!')
    end
end

