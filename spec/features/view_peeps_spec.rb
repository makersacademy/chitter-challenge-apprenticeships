feature "View peeps" do
  scenario "page allows user to see all messages" do
    visit("/chitter/messages")
    expect(page).to have_content "Message1"
  end
end
