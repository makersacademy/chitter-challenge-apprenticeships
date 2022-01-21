feature 'peeps have a date' do
  scenario 'adding a peep using the form' do
    message = 'What\'s happening peeps?'

    date = Time.now.strftime('%F')

    visit '/'
    expect(page).to have_no_content message
    expect(page).to have_no_content date

    fill_in 'message', with: message
    click_button 'Submit'

    expect(page).to have_content message
    expect(page).to have_content date
  end
end
