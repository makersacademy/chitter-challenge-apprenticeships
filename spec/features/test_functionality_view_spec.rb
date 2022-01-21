feature 'testing /view functions' do
  
  scenario '- Visibility of the default peep from DB' do
    # add_row_to_test_database
    
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, time) values ('This is a peep!', current_timestamp);")
    
    visit '/view'
    expect(page).to have_content "This is a peep!"
  end

end
