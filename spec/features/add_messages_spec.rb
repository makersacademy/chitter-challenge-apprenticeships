# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'posts a message to chitter' do
    scenario 'user can post a new message to chitter' do
        connection = PG.connect(dbname: 'chitter_test')
        connection.exec("INSERT INTO peeps (message) VALUES('I am so happy!')")
        visit '/messages/new'
        # fill_in('message', with: 'I am so happy!')
        click_button('Submit')
        expect(page).to have_content 'I am so happy!'
    end
end