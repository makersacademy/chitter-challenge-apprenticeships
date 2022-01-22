feature "Adding a new peep" do
  scenario "A user can add a new peep" do
    visit("/new")
    fill_in("message", with: "This is another peep")
    click_button("Submit")

    expect(page).to have_content "This is another peep"
  end
end
