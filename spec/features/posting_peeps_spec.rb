feature "Posting a peep" do
  scenario "User can post a new peep" do
    visit("/peeps/new")
    fill_in("message", with: "My new peep")
    click_button("Submit")
    expect(page).to have_content("My new peep")
  end
end
