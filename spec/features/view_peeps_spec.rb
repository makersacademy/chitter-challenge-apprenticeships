require './spec/setup_test_database'

feature 'Viewing peeps' do
  scenario 'A user can see peeps' do
    setup_test_database
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    visit('/home')

    expect(page).to have_content "This is a peep!"
  end
end
