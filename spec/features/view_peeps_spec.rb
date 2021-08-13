feature "peeps page" do 
  scenario "display all peeps" do 
    visit '/peeps/new'
    conn = PG.connect(dbname: 'chitter_test')
    conn.exec("INSERT INTO peeps (message) VALUES ('Test peep for FEATURE test A.');") 
    conn.exec("INSERT INTO peeps (message) VALUES ('Test peep for FEATURE test B.');") 
    conn.exec("INSERT INTO peeps (message) VALUES ('Test peep for FEATURE test C.');") 
    
    visit '/peeps'

    expect(page).to have_content('Test peep for FEATURE test A.') 
    expect(page).to have_content('Test peep for FEATURE test B.') 
    expect(page).to have_content('Test peep for FEATURE test C.') 
  end 

  
end 