
feature 'Posting a peep' do
  scenario 'Users can post a peep' do
    visit('/')
    fill_in('message', with: 'This is my first peep!')
    click_button('Post')

    expect(page).to have_content 'This is my first peep!'
  end
end