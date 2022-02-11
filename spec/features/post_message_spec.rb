feature 'Posting a new message' do 
    scenario 'A user can post a message on chitter' do 
        visit('/message/new')
        fill_in('message', with: 'Cannot wait for the weekend whoo! :D')
        click_button ('Post')

        expect(page).to have_content 'Cannot wait for the weekend whoo! :D'
    end 
end 
