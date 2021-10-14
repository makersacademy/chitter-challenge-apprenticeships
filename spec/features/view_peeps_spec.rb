feature "Viewing Peeps" do
  scenario "seeing all of the peeps" do
    connection = PG.connect dbname: "chitter_test"
    connection.exec("INSERT INTO peeps (username, message) VALUES ('TinaB', 'I love Jimmy Jnr');")
    visit "/peeps"
    expect(page).to have_content "I love Jimmy Jnr"
  end

  scenario "the date is on the page" do
    date = Time.now.strftime("%d/%m/%Y")
    connection = PG.connect dbname: "chitter_test"
    connection.exec("INSERT INTO peeps (username, message) VALUES ('TinaB', 'I love Jimmy Jnr');")
    visit "/peeps"
    expect(page).to have_content date
  end
end
