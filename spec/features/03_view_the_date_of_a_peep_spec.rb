# As a Maker
# So that I can see when people are doing things
# I want to see the date the message was posted

feature 'Show the date of the peep' do
  scenario 'on the peeps screen' do
    add_2_rows_to_test_database()
    visit('/peeps')
    expect(page).to have_content '1980-01-01'
  end
end
