require_relative '../../lib/date.rb'

feature 'filter peeps' do
  scenario 'filter peeps based on user inputted keyword' do
    connection = PG.connect(dbname: 'chitter_test')
    
    connection.exec("INSERT INTO peeps (message, date) values ('This is my first peep! Woooo', '#{give_date}');")
    connection.exec("INSERT INTO peeps (message, date) values ('OMG I just witnessed a murder', '#{give_date}');")
    connection.exec("INSERT INTO peeps (message, date) values ('FML I wish I was murdered', '#{give_date}');")
    connection.exec("INSERT INTO peeps (message, date) values ('I have a dog named Kat', '#{give_date}');")
    connection.exec("INSERT INTO peeps (message, date) values ('I have a cat named Dug', '#{give_date}');")
    connection.exec("INSERT INTO peeps (message, date) values ('Did anyone else hear about that murder?', '#{give_date}');")

    visit('/peeps')
    fill_in('keyword', with: 'Murder')
    click_button('Filter')

    expect(page).to_not have_content('This is my first peep! Woooo')
    expect(page).to_not have_content('I have a dog named Kat')
    expect(page).to_not have_content('I have a cat named Dug')
    expect(page).to have_content('OMG I just witnessed a murder')
    expect(page).to have_content('FML I wish I was murdered')
    expect(page).to have_content('Did anyone else hear about that murder?')

  end
end 