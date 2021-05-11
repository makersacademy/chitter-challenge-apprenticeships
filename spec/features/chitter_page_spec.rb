feature 'shows the chitter page' do 
    scenario 'displays messages' do 
        visit '/chitter'

        expect(page).to have_content('Welcome to Chitter!')
    end
end
