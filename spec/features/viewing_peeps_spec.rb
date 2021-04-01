require 'pg'

feature 'viewing index page' do
  scenario 'User can see the index page' do
    visit('/')
    expect(page).to have_content "Peeps!"
  end
end

feature 'viewing peeps' do
  scenario 'User can see the peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES (1, 'This is a peep!');")
    
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
  end
end
