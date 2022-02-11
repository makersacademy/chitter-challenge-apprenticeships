feature "viewing messages" do
  scenario "user can view all messages on the message board page" do
    visit ('/messageboard')

    expect(page).to have_content "Test Message 1"
    expect(page).to have_content "Test Message 2"
  end
end