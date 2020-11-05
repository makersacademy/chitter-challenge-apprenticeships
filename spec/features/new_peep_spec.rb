feature 'Adding a new message' do
  scenario 'A user can add a message to the page' do
    visit('/new')
    fill_in('message', with: 'This is my riveting post.')
    click_button('Submit')

    expect(page).to have_content 'This is my riveting post.'
  end
end
