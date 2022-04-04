feature "Viewing peeps" do
  scenario "visiting the index page" do
    visit("/")
    expect(page).to have_content("Chitter")
  end

  scenario "visiting the /peeps page" do
    first_peep = Peep.create(message: "Test peep 1")
    second_peep = Peep.create(message: "Test peep 2")
    visit("/peeps")
    expect(page).to have_content("Test peep 1")
    expect(page).to have_content("Test peep 2")
  end

end
