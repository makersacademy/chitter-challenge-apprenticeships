require 'pg'

feature 'Viewing chitter' do
  scenario 'A user can see chitter' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")
    visit('/chitter')
    expect(page).to have_content "This is a peep!"
  end
end
