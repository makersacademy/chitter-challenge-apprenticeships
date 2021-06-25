require 'pg'

feature 'So that a user can see what people are doing' do

  scenario 'user can see peeps' do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("INSERT INTO peeps (username, message) VALUES ('TestCoder420', 'just started my coding challenge!')")
    visit('/peeps')
    expect(page).to have_content("just started my coding challenge!")
  end
end
