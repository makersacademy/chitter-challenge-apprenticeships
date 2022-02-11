feature 'Posting a new message' do
  scenario 'A user can post a message to ChitterMessage' do
    visit('/new')
    fill_in('message', with: 'Today is a sunny day!')
    click_button('Submit')

    expect(page).to have_content 'Today is a sunny day!'
  end
end