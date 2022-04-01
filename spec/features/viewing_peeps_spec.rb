feature "Viewing peeps" do
  scenario "visiting the index page" do
    visit("/")
    expect(page).to have_content("Chitter")
  end

  scenario "visiting the /peeps page" do
    first_peep = Peep.create(message: "Test peep 1")
    second_peep = Peep.create(message: "Test peep 2")
    visit("/peeps")
    expect(page).to have_content(first_peep.message)
    expect(page).to have_content(second_peep.message)
  end

end
