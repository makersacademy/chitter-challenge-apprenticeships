require 'pg'

feature 'View all peeps (messages): ' do

  scenario 'click on button to view all peeps (messages)' do
    visit '/'
    expect(page).to have_button('View peeps')
  end
  
  scenario 'peeps (messages) are displayed' do
    connection = PG.connect(dbname: 'chitter_test')

    # Add the test data
    connection.exec("INSERT INTO peeps (message) values ('Hello, this is a new peep!');")
    connection.exec("INSERT INTO peeps (message) values ('What peep shall I write today?');")
    connection.exec("INSERT INTO peeps (message) values ('My favourite food is pizza');")


    visit '/'
    click_button 'View peeps'
    expect(page).to have_content('Hello, this is a new peep!')
    expect(page).to have_content('What peep shall I write today?')
    expect(page).to have_content('My favourite food is pizza')

  end

end
