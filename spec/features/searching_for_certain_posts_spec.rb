feature 'allows users to keyword search for peeps' do 
  scenario 'fill in keyword to return peeps that include that keyword' do 
    time = Time.now
    con = PG.connect(dbname: 'chitter_test') 
    con.exec "INSERT INTO peeps (message, time) VALUES('I like drinking tea', '#{time.strftime("Posted at %I:%M%p")}');"
    con.exec "INSERT INTO peeps (message, time) VALUES('I like drinking coffee', '#{time.strftime("Posted at %I:%M%p")}');"
    visit('/messageboard')
    fill_in 'keyword', with: 'coffee'
    click_button 'Search'
    expect(page).to have_content 'I like drinking coffee'
    expect(page).to_not have_content 'I like drinking tea'
  end 
end