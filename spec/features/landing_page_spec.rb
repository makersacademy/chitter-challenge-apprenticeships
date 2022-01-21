feature 'landing page' do
  scenario '-it displays the posts on a landing page' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
    visit('/')
    expect(page).to have_content 'This is a peep!' 
  end

  scenario '-it displays the posts w/date on a landing page' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is a peep!');")
    visit('/')
    expect(page).to have_content "This is a peep!- #{Time.now.strftime("%Y-%m-%d")}" 
    # expect(page).to have_content 'This is a peep!- 2022-01-21' 
  end 

end