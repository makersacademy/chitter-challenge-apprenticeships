feature "Viewing home page" do
  scenario "visiting the home page" do
    visit("/")
    expect(page).to have_content "chitter"
  end

  scenario "user viewing latest peeps on home page" do
    db = PG.connect(dbname: "chitter_test")
    db.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")

    visit("/")
    expect(page).to have_content("This is a peep!")
  end

  scenario "user posting a new peep via a form" do
    db = PG.connect(dbname: "chitter_test")
    visit("/")
    fill_in :new_peep, with: "Eating right now!"
    click_button("post")
    expect(page).to have_content("Eating right now!")
  end
end
