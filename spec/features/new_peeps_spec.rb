feature "new peeps page" do 
  scenario "able to submit a new peep" do 
    visit '/peeps/new'
    peep_date = Time.new.strftime("%Y-%m-%d")
    conn = PG.connect(dbname: 'chitter_test')
    conn.exec("INSERT INTO peeps (message, peep_date) VALUES ('Test peep for FEATURE test 1.', '#{peep_date}' );") 

    visit '/peeps'

    expect(page).to have_content("Test peep for FEATURE test 1.")
    expect(page).to have_content(peep_date)

  end 
end 