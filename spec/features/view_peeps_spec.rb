feature 'viewing peeps' do
  scenario 'visiting the homepage' do
    visit('/')
    expect(page).to have_content("My peeps")
  end

  scenario 'showing a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES (1, 'Test peep');")
    connection.exec("INSERT INTO peeps VALUES (2, 'Test peep two');")

    visit('/')
    expect(page).to have_content("Test peep" && "Test peep two")
  end
end
