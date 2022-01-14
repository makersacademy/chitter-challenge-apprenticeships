require "pg"

feature "Viewing peeps" do
  scenario "User can see the peeps" do
    add_row_to_test_database

    visit("/")

    expect(page).to have_content("This is a peep!")
    expect(page).to have_content("This is a peep too!")
    expect(page).to have_content("This is another peep!")
    expect(page).to have_content("This is just a peep!")
  end
end
