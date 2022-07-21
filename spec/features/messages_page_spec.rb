feature '/' do
  scenario 'to submit a form' do
    visit '/'
    fill_in 'Message', with: 'First Message'
    click_on 'Submit'
    visit '/messages'
    expect(page).to have_content "First Message"
  end
end
