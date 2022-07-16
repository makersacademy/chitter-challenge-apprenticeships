feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    # connection = PG.connect(dbname: 'chitter_test')

    # # Add the test data
    # connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")

    # Peep.create(username: 'User1', message: 'This is a peep!')
    # Peep.create(username: 'User2', message: 'Here is another peep!')
    Peep.create(username: 'User3', message: 'One more peep!')

    visit('/peeps')

    # expect(page).to have_content("User1, This is a peep!")
    # expect(page).to have_content("User2, Here is another peep!")
    expect(page).to have_content("User3, One more peep!")
  end
end
