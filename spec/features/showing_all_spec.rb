feature "show all the messages" do
  scenario "shows all the messages" do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');") 
    visit "/messages" 
    expect(page).to have_content "This is a peep!"
  end
end
