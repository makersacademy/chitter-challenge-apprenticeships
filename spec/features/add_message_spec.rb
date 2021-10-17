require 'pg'

feature 'add message' do
  scenario 'add a peep to the chitter page' do 
    visit ('/new')
    fill_in("message", with: "im new on chitter!")
    fill_in("message_date", with: '10-10-2021')
    click_button "Submit"
    expect(page).to have_content "im new on chitter!"
  end

  scenario 'click add peep to redirect to add message page' do
    visit ('/chitter')
    click_button "Add Peep"
    expect(page).to have_content "Add New Peep"
  end

end


