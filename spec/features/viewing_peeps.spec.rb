feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    #Add test data
    connection.exec("INSERT INTO peeps (message) VALUES(1, 'Hey, how this website works?');")
    connection.exec("INSERT INTO peeps (message) VALUES (2, 'I am new here');")
    connection.exec("INSERT INTO peeps (message) VALUES (3, 'Hello there');")

    visit('/peeps')

    expect(page).to have_content 'Hey, how this website works?'
    expect(page).to have_content 'I am new here'
    expect(page).to have_content 'Hello there'
  end
end
