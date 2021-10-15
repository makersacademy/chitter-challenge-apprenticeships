feature 'visiting the home page' do
    scenario 'the page title is visible' do
        visit '/'
    
        expect(page).to have_content 'Chitter'
    end
end

feature 'Viewing peeps' do
    scenario 'A user can see all peeps in a browser' do
        Peep.create(message: "1 - This is an example message")
        Peep.create(message: "2 - This is an example message")
        Peep.create(message: "3 - This is an example message")

        visit('/chitter')

        expect(page).to have_content("1 - This is an example message")
        expect(page).to have_content("2 - This is an example message")
        expect(page).to have_content("3 - This is an example message")
    end
end
