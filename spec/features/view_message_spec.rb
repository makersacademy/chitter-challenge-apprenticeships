feature 'view message' do
  scenario 'allows user to view all messages' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep!');")

    visit '/peeps'
    expect(page).to have_content 'This is a peep!'
  end
end
