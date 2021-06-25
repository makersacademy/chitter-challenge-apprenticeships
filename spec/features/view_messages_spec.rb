feature 'View messages' do
    scenario 'User can view all messages' do
        visit('/messages')
        expect(page).to have_content('This is my first message!')
    end
end
