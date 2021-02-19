require 'pg'

feature 'Viewing peeps' do
  scenario 'visiting the index page' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'None of your emails are finding me well');")
    connection.exec("INSERT INTO peeps VALUES(2, 'I need a room full of mirrors so I can be surrounded by winners');")
    
    visit('/peeps')

    expect(page).to have_content "None of your emails are finding me well"
    expect(page).to have_content "I need a room full of mirrors so I can be surrounded by winners"
  end
end
