# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

feature 'Chitter homepage' do
  scenario 'shows welcome message' do
    visit('/')
    expect(page).to have_content 'Welcome to Chitter'
  end
end
