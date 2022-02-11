feature 'Viewing test page' do
  scenario 'visiting the test page' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Hey there it''s Friday');")
    connection.exec("INSERT INTO peeps (message) VALUES ('Fri-Yay!');")
  
    visit('/chitter')
    expect(page).to have_content "Hey there it's Friday"
    expect(page).to have_content "Fri-Yay!"
  end
end
