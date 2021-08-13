feature 'Viewing messages' do
  scenario 'A user can see all messages' do
    visit('/messages/home')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is also a peep!"
  end
end
