feature "peeps page" do 
  scenario "display all peeps (content only)" do 
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

  scenario "display peeps' date " do 
    visit '/peeps/new'
    conn = PG.connect(dbname: 'chitter_test')
    current_date = Date.today
    
    conn.exec("INSERT INTO peeps (message, peep_date) VALUES ('Test peep for FEATURE test D.', '#{current_date}');")

    visit '/peeps'

    expect(page).to have_content('Test peep for FEATURE test D.')
    expect(page).to have_content(current_date)
    
  end 

  
end 