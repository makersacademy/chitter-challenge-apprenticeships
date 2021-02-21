require 'pg'

feature 'view all peeps' do
  scenario 'visiting /all_peeps' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps VALUES(1, 'This is a peep');")
    connection.exec("INSERT INTO peeps VALUES(2, 'This is another peep');")
    connection.exec("INSERT INTO peeps VALUES(3, 'Yet another peep');")

    sign_in_and_submit
    click_link 'View all peeps'

    expect(page).to have_content('This is a peep')
    expect(page).to have_content('This is another peep')
    expect(page).to have_content('Yet another peep')
  end
end