feature 'Viewing Peeps' do
  scenario 'displays all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
    visit('/')
    expect(page).to have_content 'This is a peep!'
  end
end
