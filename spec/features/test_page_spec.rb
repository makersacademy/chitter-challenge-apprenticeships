require 'pg'

feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end

  scenario 'visit chitter and see chits' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'test-peep');")
    
    visit('/chitter')
    
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_content "test-peep"
  end

end
