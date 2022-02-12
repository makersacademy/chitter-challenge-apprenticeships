feature "updating a message" do
  scenario "a user wishes to update an existing message" do
    message = Message.create(name: 'Alan', message: 'Update this message')
    visit('/messageboard')
    expect(page).to have_content("Alan - Update this message")

    first('.message').click_button('Edit')
    expect(current_path).to eq "/messageboard/#{message.id}/edit"

    fill_in('Name', with: 'Alan2')
    fill_in('Message', with: 'An updated message')
    click_button('Submit')

    expect(current_path).to eq "/messageboard"
    expect(page).not_to have_content("Alan - Update this message")
    expect(page).to have_content("Alan2 - An updated message")
  end
end
