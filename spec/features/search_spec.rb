feature 'Searching for peeps by keyword' do
    scenario 'A user can find peeps by keyword' do
        visit('/new')
        fill_in('message', with: 'Foxes are great')
        click_button('Submit')

        visit('/new')
        fill_in('message', with: 'Foxes are the best animals!')
        click_button('Submit')

        visit('/new')
        fill_in('message', with: 'This is a peep')
        click_button('Submit')

        visit('/search')
        fill_in('keyword', with: 'Foxes')
        click_button('Submit')

        expect(page).to have_content('Foxes are the best animals!')
        expect(page).to have_content('Foxes are great')
        expect(page).not_to have_content('This is a peep')
    end
end