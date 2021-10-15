feature "View peeps" do
  scenario "page allows user to see all messages" do
    connection = PG.connect(dbname: "chitter_test")
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES ('London was experiencing severe congestion in zone 1 today');")
    visit("/")
    click_button "Check your feed"
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "London was experiencing severe congestion in zone 1 today"
  end
end
