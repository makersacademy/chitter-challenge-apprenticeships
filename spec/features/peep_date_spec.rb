require 'pg'
require 'peep'

feature 'Show peep date' do
  scenario 'it shows a date peep was added' do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/peeps')
    click_button 'Add'
    fill_in('message', with: "Party is here")
    click_button 'Submit'
    expect(page).to have_content "Party is here"

  end
end
