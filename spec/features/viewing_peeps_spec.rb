require "pg"

feature "Viewing peeps" do
  scenario "User can see the peeps" do
    add_row_to_test_database

    visit("/peeps")

    expect(page).to have("This is a peep!")
  end
end
