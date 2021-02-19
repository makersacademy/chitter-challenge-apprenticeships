require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    
    Peep.create(message: "None of your emails are finding me well" )
    Peep.create(message: "I need a room full of mirrors so I can be surrounded by winners")
    visit('/peeps')

    expect(page).to have_content "None of your emails are finding me well"
    expect(page).to have_content "I need a room full of mirrors so I can be surrounded by winners"
  end
end
