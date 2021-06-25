feature 'View all peeps' do
  scenario 'A user can see all peeps in browser' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Welcome to Chitter!');")
    connection.exec("INSERT INTO peeps VALUES(3, 'My first peep!');")

    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_content "My first peep!"
  end

end