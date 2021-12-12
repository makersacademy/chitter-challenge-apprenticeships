feature 'have a header' do
    scenario 'Displays the website name' do
        visit('/')
        expect(page).to have_content 'CHITTER'
    end
end

feature '/messages' do
    scenario 'Displays messages' do
        test_db_inserts
        visit('/messages')
        expect(page).to have_content 'I hate mondays'
    end

    scenario 'Posts a message' do
        test_db_inserts
        visit('/messages')
        page.fill_in('post_message', with: 'potasium is lit fam')
        page.click_button('post')

        expect(page).to have_content('potasium is lit fam')
    end
end