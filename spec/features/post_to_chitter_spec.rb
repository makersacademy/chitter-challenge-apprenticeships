require 'pg'

feature 'post message (peep) to browser' do 
  scenario 'after posting to chitter' do 
    
    visit '/messages/new'
    fill_in('new_post', with: 'Here is a peep update from Makers Student')
    click_button('Submit')
  
    expect(page).to have_content 'Here is a peep update from Makers Student'
  end 
end 