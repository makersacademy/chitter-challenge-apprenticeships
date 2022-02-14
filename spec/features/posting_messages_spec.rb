feature 'Posting new message with date' do
  scenario 'A user can post a message to ChitterMessage' do
    visit('/newpost')
    fill_in('message', with: 'I am fine.')
    click_button('Submit')

    expect(page).to have_content 'I am fine.'
    #expect(page).to have_content Date.today
  end
end