require 'pg'
require 'time'

feature 'So that a user can see what people are doing' do

  let(:connection) { PG.connect(dbname: 'chitter_test') }
  let(:date) { Time.new }

  scenario 'user can see peeps' do
    connection.exec("INSERT INTO peeps (username, message) VALUES ('TestCoder420', 'just started my coding challenge!')")

    visit('/peeps')

    expect(page).to have_content("just started my coding challenge!")
  end

  scenario 'user can see the date a peep was posted' do
    connection.exec("INSERT INTO peeps (username, message, date) VALUES ('TestCoder420', 'adding a date!', '#{date.strftime("%m/%d/%Y at %I:%M%p")}')")

    visit('/peeps')

    expect(page).to have_content(date.strftime("%m/%d/%Y at %I:%M%p"))
  end

  scenario 'user sees peeps displayed in reverse chronological order' do
    connection.exec("INSERT INTO peeps (username, message, date) VALUES ('TestCoder420', 'working on sort order; I am older', '06/25/2021 at 11:00AM')")
    connection.exec("INSERT INTO peeps (username, message, date) VALUES ('TestCoder999', 'working on sort order; I am more recent', '06/25/2021 at 11:09AM')")

    visit('/peeps')

    expect(first('.peep')).to have_content("I am more recent")
  end

end
