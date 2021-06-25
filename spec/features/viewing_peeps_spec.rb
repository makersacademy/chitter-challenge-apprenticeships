require 'pg'

feature 'View peeps' do
  scenario 'user can view peeps' do
    connection = PG.connect(dbname:'chitter_test')

    #Add test data
    connection.exec("INSERT INTO peeps VALUES(1, 'This is a test peep!');")

    visit '/Chitter'
    expect(page).to have_content 'This is a test peep!'
  end
end

# today = Time.now
# p today
# p today.day
# p today.month
# p today.year
