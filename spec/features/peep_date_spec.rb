require 'pg'
require 'peep'

feature 'Show peep date' do
  scenario 'it shows a date peep was added' do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/peeps')
    click_button 'Add'
    fill_in('message', with: "Party is here")
    fill_in('date', with: "21 May 2020")
    click_button 'Submit'
    expect(page).to have_content "Party is here"
    expect(page).to have_content "21 May 2020"
  end
end 
