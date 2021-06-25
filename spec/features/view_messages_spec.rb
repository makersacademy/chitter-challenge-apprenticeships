require 'pg'

feature 'View messages' do
    scenario 'User can view messages' do
        Message.create(message: 'This is my first message!')
        Message.create(message: 'This is my second message!')
        visit('/messages')
        expect(page).to have_content('This is my first message!')
        expect(page).to have_content('This is my second message!')
    end

    scenario 'User can view messages with dates' do
        first_message = Message.create(message: 'This is my first message!')
        second_message = Message.create(message: 'This is my second message!')
        visit('/messages')
        expect(page).to have_content('This is my first message!')
        expect(page).to have_content(first_message.date)
        expect(page).to have_content('This is my second message!')
        expect(page).to have_content(second_message.date)
    end
end

