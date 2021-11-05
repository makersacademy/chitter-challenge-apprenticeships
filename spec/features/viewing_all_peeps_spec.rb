feature 'Viewing Peeps' do
    scenario 'A user can view all peeps' do
      add_row_to_test_database        
      visit '/chitter'
        
      expect(page).to have_content("First Peep, HELLO Aladdin!")
      expect(page).to have_content("Second Peep, HELLO Genie!")
      expect(page).to have_content("Third Peep, HELLO Rajah!")
    end
end