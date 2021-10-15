require_relative "../../lib/peeps"
require_relative "../setup_test_database"

feature "View Messages" do
  scenario "see the list of messages" do
    setup_test_database
    add_row_to_test_database

    visit("/messages")

    expect(page).to have_content "This is a peep!"
  end
end
