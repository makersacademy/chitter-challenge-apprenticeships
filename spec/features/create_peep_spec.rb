feature "Create peep" do
  scenario "display message added to database" do
    add_row_to_test_database
    visit "/"
    expect(page).to have_content("This is a peep!")
  end
end
