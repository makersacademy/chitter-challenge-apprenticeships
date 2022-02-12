feature 'Viewing messages' do
  scenario 'A user can see messages' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Hello everyonep!');")
    connection.exec("INSERT INTO peeps VALUES(3, 'How are you!');")
    
    visit('/message')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "Hello everyonep!"
    expect(page).to have_content "How are you!"
  end
end