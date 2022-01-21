feature 'shows all of the peeps on the homepage' do 
  scenario 'open the website and see all of the peeps' do 
    time = Time.now
    con = PG.connect(dbname: 'chitter_test') 
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my first test message', '#{time.strftime("Posted at %m/%d/%Y")}');"
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my second test message', '#{time.strftime("Posted at %m/%d/%Y")}');"
    con.exec "INSERT INTO peeps (message, time) VALUES('This is my third test message', '#{time.strftime("Posted at %m/%d/%Y")}');"
    
    visit('/messageboard')
    save_and_open_page
    expect(page).to have_content('This is my first test message')
    expect(page).to have_content('This is my second test message')
    expect(page).to have_content('This is my third test message')
  end 
end 
