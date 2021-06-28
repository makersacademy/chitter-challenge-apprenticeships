# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

feature 'Viewing peeps' do
  scenario 'user can view all peeps' do
    Peep.add('This is a peep!', '2021-06-27')
    Peep.add('Another peep, peeps!', '2021-06-27')
    visit('/')
    expect(page).to have_content 'This is a peep!'
    expect(page).to have_content "Another peep, peeps!"
  end
end

# As a Maker
# So that I can see when people are doing things
# I want to see the date the message was posted
# (Hint the database table will need to change to store the date too)

feature 'Adding date posted' do
  scenario 'user can see the date peeps were posted' do
    add_row_to_test_database
    visit('/')
    expect(page).to have_content '2021-06-27'
  end
end

# As a Maker
# So that I can easily see the latest peeps
# I want to see a list of peeps in reverse chronological order

feature 'Reverse order' do
  scenario 'user can see peeps in reverse chronological order' do
    add_row_to_test_database
    Peep.add('Another peep', '2021-06-28')
    visit ('/')
    expect(page.all('li').first).to have_content 'Another peep'
  end
end
