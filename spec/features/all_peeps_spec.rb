require 'pg'

feature 'view all peeps' do
  scenario 'visiting /all_peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('This is a peep', '#{Time.new(2019, 06, 21)}')")
    connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('This is another peep', '#{Time.new(2020, 01, 02)}')")    
    connection.exec("INSERT INTO peeps (message, date_of_peep) VALUES('Yet another peep', '#{Time.new(2021, 02, 11)}')")

    sign_in_and_submit
    click_link 'View all peeps'

    expect(page).to have_content('Yet another peep - 2021-02-11')
    expect(page).to have_content('This is a peep - 2019-06-21')
    expect(page).to have_content('This is another peep - 2020-01-02')
    
  end
end