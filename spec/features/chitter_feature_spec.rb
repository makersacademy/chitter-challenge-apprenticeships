feature 'Viewing Chitter page' do
  scenario 'visiting the Chitter page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end

  scenario 'it can display a list of peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    # Add the test data
    connection.exec("INSERT INTO peeps VALUES(1, 'Test peep1')")
    # visit the peeps page
    visit('/peeps')
    expect(page).to have_content "Test peep1"
  end

  # scenario 'it can add a peep' do
  #
  # end
end
