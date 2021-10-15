# User Story 2
# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter

feature 'Add a message to the browser' do
  scenario 'Browser shows message I have added' do
    visit('/message/new')
    fill_in('message', with: "I have added a message")
    click_button('Submit')
    expect(page).to have_content "I have added a message"
  end
end
