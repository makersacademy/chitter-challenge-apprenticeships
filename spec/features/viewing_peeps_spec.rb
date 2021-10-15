require "pg"

feature "Viewing peeps" do
  scenario "User can view all the messages (peeps)" do
    connection = PG.connect(dbname: "chitter_test")

    # Add the test data
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES('This is another peep!');")

    visit("/peeps")

    expect(page).to have_content("This is a peep!")
    expect(page).to have_content("This is another peep!")
  end
end
