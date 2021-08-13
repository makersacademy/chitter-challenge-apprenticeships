require 'pg'

feature 'Viewing messages' do
  scenario 'A user can see all messages' do
    Message.create(message: "Hi Everyone")
    Message.create(message: "Hope you are enjoying Chitter as much as me")
    
    visit('/messages')

    expect(page).to have_content "Hi Everyone"
    expect(page).to have_content "Hope you are enjoying Chitter as much as me"
  end
end 