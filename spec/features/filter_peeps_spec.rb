require 'pg'
feature 'find my keyword' do
  scenario 'it finds peeps that contain a keyword' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'I wanna dance with somebody');")
    connection.exec("INSERT INTO peeps VALUES(2, 'Whitney Houston');")
    visit('/peeps')
    click_button 'Keyword'
    fill_in('keyword', with: 'somebody')
    click_button 'Find'
    expect(page).to have_content 'I wanna dance with somebody'
  end
end
