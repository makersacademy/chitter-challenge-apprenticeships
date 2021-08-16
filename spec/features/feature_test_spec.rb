feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end

feature '/peeps route' do
  scenario 'displays all peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    connection.exec("INSERT INTO peeps (message) VALUES('We''re going to build a well!');")
    connection.exec("INSERT INTO peeps (message) VALUES('Noone needs to pay for it- we got you!');")
    connection.exec("INSERT INTO peeps (message) VALUES('Hang on who needs wells these days anyways?');")

    visit('/peeps')

    expect(page).to have_content("This is a peep!")
    expect(page).to have_content("We're going to build a well!")
    expect(page).to have_content("Noone needs to pay for it- we got you!")
    expect(page).to have_content("Hang on who needs wells these days anyways?")
  
  end
end

feature 'user can add a peep' do
  scenario 'user can add a peep message' do
    visit('/')
    fill_in('message', with: 'Yoyoyo')
    click_on('Peep')
    expect(page).to have_content "Yoyoyo"
  end  
end