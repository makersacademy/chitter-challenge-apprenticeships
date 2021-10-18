feature 'Viewing chitter' do
    scenario 'visiting the chitter page' do
        visit('/chitter')
        expect(page).to have_content("Chitter feed")
    end
end

feature 'Posting a peep' do
    scenario 'visiting the page' do
        visit('post-a-peep')
        expect(page).to have_content("Post a Peep")
        expect(page).to have_content("Your peep:")
        expect(page).to have_field("peep")
        expect(page).to have_button("Submit")
    end
end