require "pg"

feature "view peeps" do
  scenario "shows user a list of all peeps in a browser" do
    connection = PG.connect(dbname: "chitter_test")
    visit("/add")
    fill_in :message, with: "He talks in maths"
    click_button "Peep"
    visit "/view"
    expect(page).to have_content("He talks in maths")
  end
end
