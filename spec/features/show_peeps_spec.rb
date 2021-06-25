require 'pg'
require 'time'

feature 'So that a user can see what people are doing' do
let(:connection) { PG.connect(dbname: 'chitter_test') }
let(:date) { Time.new }

  scenario 'user can see peeps' do
    # connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (username, message) VALUES ('TestCoder420', 'just started my coding challenge!')")
    visit('/peeps')
    expect(page).to have_content("just started my coding challenge!")
  end

  scenario 'user can see the date a peep was posted' do
    connection.exec("INSERT INTO peeps (username, message, date) VALUES ('TestCoder420', 'just started my coding challenge!', '#{date.strftime("%m/%d/%Y at %I:%M%p")}')")
    visit('/peeps')
    expect(page).to have_content(date.strftime("%m/%d/%Y at %I:%M%p"))
  end
end
