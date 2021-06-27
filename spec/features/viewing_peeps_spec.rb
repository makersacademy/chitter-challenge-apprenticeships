feature 'Viewing peeps' do
  scenario 'visiting the home page' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'hi there Chitter friends');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Chits for all');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Come and join the party');")

    visit('/')

    expect(page).to have_content "Welcome to the Chitter site"
    expect(page).to have_content "hi there Chitter friends"
    expect(page).to have_content "Chits for all"
    expect(page).to have_content "Come and join the party"
  end
end
