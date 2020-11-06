feature 'see all messages' do

  scenario 'a user gets to the welcome screen' do
    visit ('/')
    expect(page).to have_content 'Welcome to Peeps'
  end

  scenario 'a user can see all messages' do
    visit ('/peeps')
    expect(page).to have_content 'The weather is very gloomy'
    expect(page).to have_content 'Back in lockdown!'
    expect(page).to have_content 'Hope everyone is happy!'
  end
end
