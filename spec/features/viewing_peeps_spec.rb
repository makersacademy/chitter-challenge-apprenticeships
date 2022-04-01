feature "Viewing peeps" do
  scenario "visiting the index page" do
    visit("/")
    expect(page).to have_content("Chitter")
  end

  xscenario "visiting the /peeps page" do
    first_peep = Peep.create(message: "Test peep 1")
    second_peep = Peep.create(message: "Test peep 2")
    visit("/peeps")
    expect(page).to have_content(peep_1.message)
    expect(page).to have_content(peep_2.message)
  end

end
