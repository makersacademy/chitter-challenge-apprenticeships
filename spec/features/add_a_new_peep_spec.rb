feature 'Add' do
  scenario 'user adds a new message' do
    visit '/messages'
    fill_in('new_message', with: "This is a new peep")
    click_button('Post')

    expect(page).to have_content "This is a new peep"
  end
end
