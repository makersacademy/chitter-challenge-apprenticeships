feature 'view all peeps' do
  scenario 'display all peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');") 
    visit "/peeps" 
    expect(page).to have_content "This is a peep!"
  end
end
