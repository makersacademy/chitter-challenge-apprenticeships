require_relative "../../lib/peeps"
require_relative "../setup_test_database"

feature "See date of Peeps" do
  scenario "see the date a peep was posted" do
    setup_test_database
    Peeps.create("Datetest")

    visit("/messages")

    expect(page).to have_content "#{Time.now}"
  end
end
