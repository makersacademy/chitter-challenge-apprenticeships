feature 'show all peeps in reverse chronological order' do
  scenario 'latest peep should show up at the top' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message) values ('This is the first peep!');")
    connection.exec("INSERT INTO peeps (message) values ('This is the second peep!');")
    
    visit('/')
    index_of_first_peep = page.body.index('This is the first peep!')
    index_of_second_peep = page.body.index('This is the second peep!')

    expect(index_of_second_peep).to be < index_of_first_peep
  end
end
