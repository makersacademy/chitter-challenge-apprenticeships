require 'chitter'

feature 'creating a chit' do
  scenario 'viewing a chit you created' do
    visit('/chitter/new')
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) VALUES('CHITT')")
    visit('/chitter')
    expect(page).to have_content "CHITT"
  end
end
