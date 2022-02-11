require 'pg'

feature 'shows chitter peeps' do
  scenario '.all shows peeps' do
    conn = PG.connect(dbname: 'chitter_test')

    conn.exec("INSERT INTO peeps VALUES(1, 'Hello');")

    visit '/'

    expect(page).to have_content 'Hello'
  end 
end