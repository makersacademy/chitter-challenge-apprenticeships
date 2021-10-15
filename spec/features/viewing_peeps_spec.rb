require "pg"

feature "viewing peeps" do
  scenario "A Maker can view peeps" do
    connection = PG.connect(dbname: "chitter_test")
    connection.exec("INSERT INTO peeps (message) VALUES ('I''m ordering pizza tonight no shame');")
    connection.exec("INSERT INTO peeps (message) VALUES('STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!');")
    connection.exec("INSERT INTO peeps (message) VALUES('I like turtles');")

    visit("/peeps")

    expect(page).to have_content "I'm ordering pizza tonight no shame"
    expect(page).to have_content "STOP PLAYING CHRISTMAS MUSIC IN OCTOBER!"
    expect(page).to have_content "I like turtles"
  end
end
