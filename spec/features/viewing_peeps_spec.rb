feature 'Viewing Peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter: Latest Peeps"
  end

  scenario 'Visiting /bookmarks shows me all the peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    # add test data
    connection.exec("INSERT INTO peeps (message) VALUES ('This is a peep!');")
    Peeps.create(message: "This is a peep!")

    visit('/peeps')
  end


end
