feature 'viewing peeps' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'a user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES('peep1!'); ")
    connection.exec("INSERT INTO peeps (message) VALUES('peep2!'); ")
    connection.exec("INSERT INTO peeps (message) VALUES('peep3!'); ")
    visit ('/peeps')
    expect(page).to have_content "peep1!"
    expect(page).to have_content "peep2!"
    expect(page).to have_content "peep3!"
  end

end