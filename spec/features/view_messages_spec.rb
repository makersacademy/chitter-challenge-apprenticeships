require 'pg'

feature 'Viewing messages' do
  scenario 'shows all messages' do

    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Hello');")
    connection.exec("INSERT INTO peeps (message) VALUES('Hi!');")
    connection.exec("INSERT INTO peeps (message) VALUES('Hiya.');")

    visit ('/peeps')

    expect(current_path).to eq '/peeps'
    expect(page).to have_content 'Hello'
    expect(page).to have_content 'Hi!'
    expect(page).to have_content 'Hiya.'
  end
end
