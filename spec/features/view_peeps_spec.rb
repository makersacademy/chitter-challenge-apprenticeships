# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser

feature 'Viewing peeps' do
  scenario 'user can view all peeps' do
    Peep.add(message: 'This is a peep!')
    Peep.add(message: 'Another peep, peeps!')
    visit('/')
    expect(page).to have_content 'This is a peep!'
    expect(page).to have_content "Another peep, peeps!"
  end
end


# As a Maker
# So that I can see when people are doing things
# I want to see the date the message was posted
# (Hint the database table will need to change to store the date too)

# feature 'Adding date posted' do
#   scenario 'user can see the date peeps were posted' do
#     add_row_to_test_database
#     visit('/')
#     expect(page).to
#   end
# end

#
# As a Maker
# So that I can easily see the latest peeps
# I want to see a list of peeps in reverse chronological order
