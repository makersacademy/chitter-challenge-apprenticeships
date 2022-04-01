feature 'Adding a new post' do
  scenario 'a user can add a new post' do
    visit('/posts/new')
    fill_in("author", with: "Rose")
    fill_in("message", with: "How are you?")
    click_button('Submit')

    expect(page).to have_content("Rose", "How are you?")
  end
end
