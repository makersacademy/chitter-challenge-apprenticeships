feature 'testing /view functions' do
  
  scenario '- Visibility of the default peep from DB' do
    # add_row_to_test_database
    
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, time) values ('This is a peep!', current_timestamp);")
    
    visit '/view'
    expect(page).to have_content "This is a peep!"
  end

  scenario '- added peeps are visible' do
            
    Chittermanager.create(peep: "a new peep")
    visit '/view'
    expect(page).to have_content "a new peep"
  end
 
  scenario '- see a date of a message' do
            
    Chittermanager.create(peep: "a new peep")
    visit '/view'
    expect(page).to have_content "2022-01-21"
  end

  
end
