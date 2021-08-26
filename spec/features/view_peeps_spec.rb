require 'pg'
feature "view peeps" do
  
  scenario "user wants to view the peeps" do

    connection = PG.connect(dbname: 'chitter_test')
  
      # Add the test data
    connection.exec("INSERT into peeps (message) VALUES ('yo');")
    connection.exec("INSERT into peeps (message) VALUES ('hello');")
    connection.exec("INSERT into peeps (message) VALUES ('cool');")
    
    visit '/peeps'

    

    expect(page).to have_content "yo"
    expect(page).to have_content "hello"
    expect(page).to have_content "cool"
  
  end
end