require_relative "../../lib/peeps"
require_relative "../setup_test_database"

feature "Create a Peep" do
  scenario "I can create a new message on the board" do
    setup_test_database
    visit("/messages/new")
    fill_in("message", with: "My new message")
    click_button("Submit")
    expect(page).to have_content "My new message"
  end
end
