require 'pg'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end
end