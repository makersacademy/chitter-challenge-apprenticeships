require 'pg'

feature 'All messages' do
  scenario 'user can see all messages in a browser' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'Makers Academy');")
    visit('/peeps')
    expect(page).to have_content 'Makers Academy'
  end
end
