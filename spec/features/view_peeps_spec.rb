feature 'Viewing peeps' do
    scenario 'A user can see all messages in browser ' do

        connection = PG.connect(dbname: 'chitter_test')

        # Add the test data
        connection.exec("INSERT INTO peeps (message) VALUES ('peep1');")
        connection.exec("INSERT INTO peeps (message) VALUES('peep2');")
        connection.exec("INSERT INTO peeps (message) VALUES('peep3');")
          

       

        visit('/all-messages')
  
        expect(page).to have_content "peep1"
        expect(page).to have_content "peep2"
        expect(page).to have_content "peep3"
    end
  end 