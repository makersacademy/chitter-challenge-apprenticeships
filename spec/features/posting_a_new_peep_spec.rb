feature "Posting a peep to Chitter" do
  scenario "A user can post a peep to Chitter" do
    visit("/peeps/new")
    fill_in("message", with: "Working on Friday challenge")
    click_button("Submit")

    expect(page).to have_content("Working on Friday challenge - Posted on 15/10/2021")
  end
end
