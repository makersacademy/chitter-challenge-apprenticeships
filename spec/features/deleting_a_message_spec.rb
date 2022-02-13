feature "deleting a message" do
  scenario "a user can delete an existing message" do
    Message.create(name: "Harry", message: "To be deleted")
    visit('/messageboard')
    expect(page).to have_content('Harry - To be deleted')

    first('.message').click_button 'Delete'

    expect(current_path).to eq '/messageboard'
    expect(page).not_to have_content('Harry - To be deleted')
  end
end
