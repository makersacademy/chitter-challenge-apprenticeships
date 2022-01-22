require "pg"

feature "Viewing filtered peeps" do
  scenario "A user can see peeps with a certain keyword" do
    connection = PG.connect(dbname: "chitter_test")

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is another peep');")

    visit("/search")
    fill_in("keyword", with: "another")
    click_button("Submit")
    expect(page).to have_content "This is another peep"
  end
end
