feature 'Posting new message' do
  scenario 'A user can post a message to ChitterMessage' do
    visit('/newpost')
    fill_in('message', with: 'I am fine.')
    click_button('Submit')

    expect(page).to have_content 'I am fine.'
  end
end