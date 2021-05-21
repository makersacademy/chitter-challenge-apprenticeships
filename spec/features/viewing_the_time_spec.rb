feature 'Viewing the time of a message' do
  scenario 'A user can see the time of the message added' do
    visit('/messages/new')
    Messages.add(messages: "Hey there hows it going today")
    current_time = Time.now
    expect(page).to have_content("#{current_time}")
  end
end