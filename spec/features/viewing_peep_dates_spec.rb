feature "Viewing peep dates" do
  scenario "User can see the date a peep was posted" do
    first_peep = Peep.create(message: "Test peep 1")
    second_peep = Peep.create(message: "Test peep 2", date: "2022-01-01")
    visit("/peeps")
    expect(page).to have_content("Test peep 1")
    expect(page).to have_content(Date.today.to_s)
    expect(page).to have_content("Test peep 2")
    expect(page).to have_content("2022-01-01")
  end
end
