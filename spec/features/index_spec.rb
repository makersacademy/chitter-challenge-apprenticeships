feature 'Viewing messages' do 
    scenario 'A user can view all messages' do 
        add_row_to_test_database
        visit('/message-board')
        expect(page).to have_content 'This is a peep!'
    end
end 