require 'pg'

feature 'Viewing messages' do
  scenario 'A user can see messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES ('This is another peep');")

    visit('/')

    expect(page).to have_content ('This is another peep')
  end

end