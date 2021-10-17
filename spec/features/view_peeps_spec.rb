feature "Viewing Peeps" do
  before(:each) do
    connection = PG.connect dbname: "chitter_test"
    connection.exec("INSERT INTO peeps (username, message) VALUES ('TinaB', 'I love Jimmy Jnr');")
    visit "/peeps"
  end

  scenario "seeing all of the peeps" do
    expect(page).to have_content "I love Jimmy Jnr"
  end

  scenario "the date is on the page" do
    date = Time.now.strftime("%d/%m/%Y")
    expect(page).to have_content date
  end
end
