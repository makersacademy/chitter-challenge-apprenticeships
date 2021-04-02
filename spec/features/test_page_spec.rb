feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end

feature 'View all messages' do
  scenario 'visit message route' do
    add_row_to_test_database
    visit('/messages')
    expect(page).to have_content "This is a peep!"
  end
end

### my test returns this :  +#<PG::Result:0x00007f7fe8dc3e48 status=PGRES_TUPLES_OK ntuples=1 nfields=2 cmd_tuples=1> but I want 
### this : ["This is a peep!"] in my test, not sure how to do this I think I have to somehow do this in my test:
###     peeps = connection.exec "SELECT * FROM peeps"
### peeps.each { |row| p row } 
### But this doesn't work in my test file
