feature 'Viewing peeps' do
    scenario 'visiting the page shows peeps' do
      visit('/peeps')

      expect(page).to have_content "This is a message" 
      expect(page).to have_content "this is also another message" 
      expect(page).to have_content "I'm learning ruby" 
      
    end
  end 