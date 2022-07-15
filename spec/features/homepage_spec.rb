feature '/' do
  scenario 'to have a form' do
    visit '/'
    fill_in 'Message', with: 'First Message'
    expect(page).to have_button('Submit')
  end
end
