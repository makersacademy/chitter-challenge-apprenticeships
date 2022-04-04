feature 'Viewing peeps' do
    scenario 'a user can see peeps' do
        visit('/peeps')
        expect(page).to have_content("This is a peep!")
        expect(page).to have_content("This is a second peep!")
        expect(page).to have_content("This is a third peep!")
    end
end
