feature 'all peeps' do
    scenario 'user can see all peeps in browser' do
        Peep.create(message: 'This is a test peep.')
        Peep.create(message: 'I like chitter way more than twitter!')

        visit('/peeps')

        expect(page).to have_content "This is a test peep."
        expect(page).to have_content "I like chitter way more than twitter!"
    end
end
