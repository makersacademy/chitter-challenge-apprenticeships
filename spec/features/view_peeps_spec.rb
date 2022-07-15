feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'Just completed SQL Zoo. It was fun to do!');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Testing adding chitter messages');")
    connection.exec("INSERT INTO peeps VALUES(3, 'testing chitter.');")
    
    visit('/chitter')
    expect(page).to have_content "Just completed SQL Zoo. It was fun to do!"
    expect(page).to have_content "Testing adding chitter messages"
    expect(page).to have_content "testing chitter."
  end
end