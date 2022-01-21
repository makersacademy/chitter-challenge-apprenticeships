feature 'search bar' do
  before do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('irb for search test');")
    connection.exec("INSERT INTO peeps (message) values ('irb for search test2');")
    # Chitter.new_peep(message: 'irb for search test')
    # Chitter.new_peep(message: 'irb for search test 2')
    visit ('/')
  end
  scenario 'it can serach for a keyword and return peeps' do
    fill_in :search, with:'irb'
    click_button 'Search'
    visit ('/search')
    expect(page).not_to have_content('This is a peep!')
    expect(page).to have_content('irb for search test')
    expect(page).to have_content('irb for search test2')
  end

end