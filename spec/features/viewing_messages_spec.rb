feature 'Viewing messages' do
  scenario 'A user can see all messages' do
    visit('/messages')

    expect(page).to have_content "Hi everyone"
    expect(page).to have_content "Hope you're enjoying Chitter as much as me"
  end
end 