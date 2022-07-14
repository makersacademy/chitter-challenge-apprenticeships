require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Merry Christmas');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Hello All');")
    connection.exec("INSERT INTO peeps (message) VALUES ('I hope this works');")

    visit('/peeps')

    expect(page).to have_content 'Merry Christmas'
    expect(page).to have_content "Hello All"
    expect(page).to have_content "I hope this works"

  end 
    scenario 'A user can see the date peeps were posted' do
      connection = PG.connect(dbname: 'chitter_test')
  
      connection.exec("INSERT INTO peeps (date) VALUES ('2020-12-25');")
      connection.exec("INSERT INTO peeps (date) VALUES ('2021-01-01');")
      connection.exec("INSERT INTO peeps (date) VALUES ('1992-05-01');")
  
      visit('/peeps')
  
      expect(page).to have_content '2020-12-25'
      expect(page).to have_content "2021-01-01"
      expect(page).to have_content "1992-05-01"
    
  end
end 