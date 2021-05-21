feature 'Viewing peeps' do
  scenario 'visiting the home page' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'Oh, hi doggy');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Cheep cheep cheep cheep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Anything for my princess');")

    visit('/')

    expect(page).to have_content "Welcome to Chipper"
    expect(page).to have_content "Oh, hi doggy"
    expect(page).to have_content "Cheep cheep cheep cheep"
    expect(page).to have_content "Anything for my princess"
  end
end