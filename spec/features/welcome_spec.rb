require 'pg'

feature 'enter Peeper' do
  it 'lets use access Peeper app' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'Peep one');")
    visit('/')
    click_button 'Enter'
    expect(page).to have_content 'Peep one'
  end
end 
