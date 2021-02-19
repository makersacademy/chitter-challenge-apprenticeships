feature "The user can post a peep on their feed" do
  scenario "user completes a message and posts it" do
    visit('/')
    fill_in :message, with: "My test tweet"
    click_button "Post"
    expect(page).to have_content "My test tweet"
  end
end
