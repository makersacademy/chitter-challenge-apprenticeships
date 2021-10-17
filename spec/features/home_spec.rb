feature "Viewing home page" do
  scenario "visiting the home page" do
    visit("/")
    expect(page).to have_content "chitter"
  end

  scenario "viewing latest peeps on home page" do
    visit("/")
    expect(page).to have_content("This is a peep!")
  end
end
