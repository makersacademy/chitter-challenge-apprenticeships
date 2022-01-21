feature 'posting peeps' do
  scenario 'adding a peep using the form' do
    message = 'What\'s up peeps!'

    visit '/'
    expect(page).to have_no_content message

    fill_in 'message', with: message
    click_button 'Submit'

    expect(page).to have_content message
  end
end
