require 'pg'

feature 'Add peep' do
  scenario 'user can add a new peep' do
    connection = PG.connect(dbname: 'chitter_test')
    visit('/peeps')
    click_button 'Add'
    fill_in('message', with: "Hello friends")
    click_button 'Submit'
    expect(page).to have_content "Hello friends"
  end
end
