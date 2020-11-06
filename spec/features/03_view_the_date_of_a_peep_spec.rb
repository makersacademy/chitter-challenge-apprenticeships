# As a Maker
# So that I can see when people are doing things
# I want to see the date the message was posted

feature 'Show the date of the peep' do
  scenario 'on the peeps screen' do
    visit('/')
    expect(page).to have_content '01/01/1980'
  end
end
