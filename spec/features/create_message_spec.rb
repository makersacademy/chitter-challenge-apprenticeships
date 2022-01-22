feature 'Create message' do
  scenario 'User can add a message' do
    visit('/')
    click_button ('New')
    fill_in('message', with: "Test message")
    click_button('Save')
    expect(page).to have_content("Test message")
  end
end
