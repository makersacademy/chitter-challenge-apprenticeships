feature 'posting a peep' do
    scenario 'user wants to post a peep' do
        visit('/peeps/post')
        fill_in :message, with: 'I am building a twitter clone'
        click_button ('Post')

        expect(page).to have_content('I am building a twitter clone')
    end
end