# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps) in a browser

feature 'view peeps' do
  scenario 'visit index page' do
    visit ('/')
    expect(page).to have_content "Chitter"
  end
end
