require 'pg'

feature 'all peeps' do
  scenario 'it displays all peeps in reverse chronological order by id' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'Peep one');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Peep two');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Peep three');")
    visit('/peeps')
    expect(page.find('li:nth-child(1)')).to have_content 'Peep three'
    expect(page.find('li:nth-child(2)')).to have_content 'Peep two'
    expect(page.find('li:nth-child(3)')).to have_content 'Peep one'
  end
end
