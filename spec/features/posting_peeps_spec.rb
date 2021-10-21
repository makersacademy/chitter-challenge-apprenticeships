feature "Posting a new peep" do
  scenario "A user can post a peep to Chitter" do
    visit("/peeps/new")
    fill_in("message", with: "I am king of the world!")
    click_button("Chit")

    expect(page).to have_content "I am king of the world!"
  end
end
