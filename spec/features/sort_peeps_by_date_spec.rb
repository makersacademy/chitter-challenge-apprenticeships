feature "Sorting peeps by date" do
  before(:each) do
    visit "/peeps"
  end

  scenario "There is a button on the page for sorting by date" do
    expect(page).to have_selector(:link_or_button, "Sort by Date")
  end

  scenario "Peeps appear on page in reverse chronological order" do
    connection = PG.connect dbname: "chitter_test"
    connection.exec("INSERT INTO peeps (username, message) VALUES ('TinaB', 'I love Jimmy Jnr');")
    connection.exec("INSERT INTO peeps (username, message) VALUES ('Teddy', 'Bobby is my best friend');")
    
    click_button "Sort by Date"

    first_li = page.find(".sorted-peeps-list li:first-child")
    expect(first_li.text).to have_content "Bobby is my best friend"
  end
end