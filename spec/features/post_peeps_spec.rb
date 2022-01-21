feature 'posting peeps' do
  scenario 'adding a peep using the form' do
    message = 'What\'s up peeps!'

    visit '/'
    expect(page).to have_no_content message

    fill_in 'message', with: message
    click_button 'Submit'

    expect(page).to have_content message
  end

  scenario 'posting a peep that is too long' do
    message = '1234567890' * ((Chitter::MAX_PEEP_LENGTH / 10) + 1)
    truncated = message[0, Chitter::MAX_PEEP_LENGTH]

    visit '/'
    expect(page).to have_no_content truncated

    fill_in 'message', with: message
    click_button 'Submit'

    expect(page).to have_content truncated
  end
end
