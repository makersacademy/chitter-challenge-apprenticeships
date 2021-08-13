require 'pg'
require 'time'

feature 'Viewing peeps' do
  scenario 'A user can see all peeps' do
    Peep.create(message: "Hi Everyone")
    Peep.create(message: "Hope you are enjoying Chitter as much as me")
    
    visit('/peeps')

    expect(page).to have_content "Hi Everyone"
    expect(page).to have_content "Hope you are enjoying Chitter as much as me"
  end
end 