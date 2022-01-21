require 'pg'

feature 'Viewing peeps' do 
  scenario 'The /peeps page displays all peeps' do
    add_row_to_test_database

    visit '/peeps'
    
    expect(page).to have_content "This is a peep!"
  end

  scenario 'The user can see the date the peep was posted' do 
    add_row_to_test_database

    visit '/peeps'

    expect(page).to have_content "2022-01-21"
  end
end
