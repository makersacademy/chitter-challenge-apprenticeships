feature 'to filter peeps for a certain keyword' do
  scenario 'i want to type in a keyword, and only posts including that should appear' do
    visit('/')

    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('I am a very important post!');")
    connection.exec("INSERT INTO peeps (message) values ('I am just a standard post!');")
        
    within '.navbar' do
      fill_in('filter', with: 'important')
      click_button('Apply')
    end

    expect(page).to have_content('I am a very important post!')
    expect(page).not_to have_content('I am just a standard post!')
  end
end
