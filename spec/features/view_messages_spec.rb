require_relative "../../lib/peeps"
require_relative "../setup_test_database"

feature "View Messages" do
  scenario "see the list of messages" do
    setup_test_database
    add_row_to_test_database

    visit("/messages")

    expect(page).to have_content "This is a peep!"
  end

  scenario "see the date a peep was posted" do
    setup_test_database
    Peeps.create("Datetest")

    visit("/messages")

    expect(page).to have_content "#{Time.now.strftime("%d/%m/%Y")}"
  end

  scenario "see the list in reverse chronological order" do
    setup_test_database
    connection = PG.connect(dbname: "chitter_test")
    connection.exec("INSERT INTO peeps (message, date) values ('This is an old peep!', '13/10/2020');")
    connection.exec("INSERT INTO peeps (message, date) values ('This is a year later peep!', '13/10/2021');")
    connection.exec("INSERT INTO peeps (message, date) values ('This is a year and 1 month later peep!', '13/11/2021');")
    connection.exec("INSERT INTO peeps (message, date) values ('This is a year and 1 month and 1 day later peep!', '14/11/2021');")

    visit("/messages")

    # expect(page).to have_content "#{Time.now.strftime("%d/%m/%Y")}"
  end
end
