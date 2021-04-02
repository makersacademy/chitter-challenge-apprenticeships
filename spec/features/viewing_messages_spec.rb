#As a Maker
#So that I can see what people are doing
#I want to see all the messages (peeps)
#in a browser

feature 'Viewing Messages' do
  scenario 'Users can view messages' do
    visit ('/peeps')
    expect(page).to have_content "This is a peep!"
  end
end