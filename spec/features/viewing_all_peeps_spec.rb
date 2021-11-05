feature 'Viewing Peeps' do
    scenario 'A user can view all peeps' do
        Peeps.create(message: "First Peep, HELLO WORLD!")
        
        visit '/chitter'
        
        expect(page).to have_content("First Peep, HELLO WORLD!")
    end
end