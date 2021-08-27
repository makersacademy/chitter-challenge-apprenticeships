require_relative '../../lib/date.rb'

feature 'viewing the peeps page' do
  scenario 'page contains peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (message, date) values ('peep 1', '#{give_date}')")
    connection.exec("INSERT INTO peeps (message, date) values ('peep 2', '#{give_date}')")
    connection.exec("INSERT INTO peeps (message, date) values ('peep 3', '#{give_date}')")

    visit('/peeps')

    expect(page).to have_content('peep 1')
    expect(page).to have_content('peep 2')
    expect(page).to have_content('peep 3')
  end
end