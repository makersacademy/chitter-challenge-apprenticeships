require 'pg'

feature 'view all messages' do
  scenario 'when visiting browser' do 
      
   # setup_test_database and add_row_to_test_database are automatically run when the test runs

      visit('/messages')
      
      expect(page).to have_content "Working with the test database"
      expect(page).to have_content "Adding test data within the tests"
      expect(page).to have_content "Saved as variable to instantiated Message class"
  end 
end 