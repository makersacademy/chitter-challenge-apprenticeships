# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser
require "pg"

feature "be able to view peeps" do
  scenario "user can view peeps messages" do
    connection = PG.connect(dbname: "chitter_test")
    
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES('This is the second peep!');")

    visit("/peeps")

    expect(page).to have_content("This is a peep!")
    expect(page).to have_content("This is the second peep!")
  end
end