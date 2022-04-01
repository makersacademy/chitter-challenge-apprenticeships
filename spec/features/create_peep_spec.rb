feature "Adds a new peep" do
    scenario "User makes peep, posts it to Peeps" do
        connection = PG.connect(dbname: "chitter_test")
        visit('/peeps/new')
        fill_in 'peep', with: 'Test peep!'
        click_button('Send peep!')
        expect(page).to have_content 'Test peep!'
        end
     end

    