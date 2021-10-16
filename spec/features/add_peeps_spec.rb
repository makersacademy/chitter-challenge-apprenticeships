feature "Add peeps" do
  scenario "page allows user to add new messages" do
    visit("/")
    click_button "Check your feed"
    visit("/peeps/all")
    click_button "Add a peep!"
    fill_in :message, with: "Today was not a great day"
    click_button "Share now"
    expect(page).to have_content "Today was not a great day"
  end
end
