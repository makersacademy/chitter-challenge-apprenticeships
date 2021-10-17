require 'pg'

feature 'add peep button' do
  scenario 'click add peep to redirect to add message page' do
    visit ('/chitter')
    click_button "Add Peep"
    expect(page).to have_content "Add New Peep"
  end

  scenario 'new peep gets added to the chitter page' do 
    visit ('/chitter/new')
    fill_in("message", with: "im new on chitter!")
    click_button "Submit"
    expect(page).to have_content "im new on chitter!"
  end

  scenario 'date of peep gets added to chitter page' do
    visit ('/chitter')
    click_button "Add Peep"
    fill_in("message", with: "im new on chitter!")
    click_button "Submit"
    date = Time.now.strftime("%Y-%m-%d")
    expect(page).to have_content (("Peeped on: #{date}"))
  end


end


