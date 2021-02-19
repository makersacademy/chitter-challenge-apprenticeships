feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES('This is not Twitter btw.');")
    connection.exec("INSERT INTO peeps (message) VALUES('Jack Dorsey would be proud of this.');")
    

    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is not Twitter btw."
    expect(page).to have_content "Jack Dorsey would be proud of this."
  end
end