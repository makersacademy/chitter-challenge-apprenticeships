feature "adding messages" do
  scenario "it adds a new message" do
    visit ('/add_message')
    fill_in :message, with: "Hello world!"
    click_button "Send Message"
    expect(page).to have_content "Hello world!"
  end
end
