require 'pg'
feature "view peeps" do
  
  scenario "user wants to view the peeps" do

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT into peeps (message) VALUES ('hi');")
    connection.exec("INSERT into peeps (message) VALUES ('how r u');")
    connection.exec("INSERT into peeps (message) VALUES ('bye');")
    
    visit '/peeps'

    

    expect(page).to have_content "hi"
    expect(page).to have_content "how r u"
    expect(page).to have_content "bye"
  
  end
end