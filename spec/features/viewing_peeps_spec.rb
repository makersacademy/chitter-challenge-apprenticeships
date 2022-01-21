require 'pg'

feature 'Viewing peeps' do 
  scenario 'The /peeps page displays all peeps' do
    add_row_to_test_database

    visit '/peeps'
    
    expect(page).to have_content "This is a peep!"
  end
end
