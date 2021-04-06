feature 'filter by word' do
    scenario 'user can filter peeps by keywords of choice' do
        Peep.create(message: "This is my first peep.")
        Peep.create(message: "I am so tired, I need a holiday away from England!")
        Peep.create(message: "England won their World Cup Qualifier game last night!")

        visit('/peeps')
        click_button("Filter")
        fill_in(keyword, with: "England")
        click_button("Submit")

        expect(page).to have_content "I am so tired, I need a holiday away from England!"
        expect(page).to have_content "England won their World Cup Qualifier game last night!"
        expect(page).not_to have_content "This is my first peep."
    end
end
