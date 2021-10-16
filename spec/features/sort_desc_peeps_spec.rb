feature "Add peeps" do
  scenario "page allows user to add new messages" do
    visit("/peeps/all")
    click_button "Sort by Newest Date"
    expect(page).to have_content "Your posts have been sorted!"
  end
end
