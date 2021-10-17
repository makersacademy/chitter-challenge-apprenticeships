require 'pg'

feature 'Viewing peeps' do
    scenario 'A user can see peeps' do
      #connection = PG.connect(dbname: 'chitter_test')

      #connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")

      Peep.create(message: "This is a peep!", date: "15/10/2021")

      visit('/peeps')
  
      #expect(page).to have_content 'This is a peep!'
      expect(page).to have_link("15/10/2021", href: "This is a peep!")
    end
  end