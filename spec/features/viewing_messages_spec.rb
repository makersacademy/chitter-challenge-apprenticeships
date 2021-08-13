feature 'Viewing messages' do
  scenario 'A user can see all the messages' do
    Message.create(message: "Heya wuu2?")
    Message.create(message: "Gr8 party last night")
    Message.create(message: "Lol")

    visit('/messages')

    expect(page).to have_content "Heya wuu2?"
    expect(page).to have_content "Gr8 party last night"
    expect(page).to have_content "Lol"
  end
  scenario 'a user can see the date the message was sent' do
    Message.create(message: "Heya wuu2?")
    visit('/messages')
    expect(page).to have_content "13/08/2021"
  end
end