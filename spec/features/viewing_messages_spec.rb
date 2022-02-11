require 'pg'

feature "viewing messages" do
  scenario "user can view all messages on the message board page" do
    Message.create(name: "Bob", message: "Test Message 1")
    Message.create(name: "Ron", message: "Test Message 2")

    visit ('/messageboard')

    expect(page).to have_content "Bob - Test Message 1"
    expect(page).to have_content "Ron - Test Message 2"
  end
end
