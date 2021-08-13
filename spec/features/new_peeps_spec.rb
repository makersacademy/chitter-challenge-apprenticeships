feature "new peeps page" do 
  scenario "able to submit a new peep" do 
    visit '/peeps/new'
    conn = PG.connect(dbname: 'chitter_test')
    conn.exec("INSERT INTO peeps (message) VALUES ('Test peep for FEATURE test 1.');") 

    visit '/peeps'

    expect(page).to have_content("Test peep for FEATURE test 1.")
  end 
end 