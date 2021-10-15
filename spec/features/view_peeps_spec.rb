feature 'Viewing peeps' do
    scenario 'A user can see all messages in browser ' do
      visit('/all-messages')
  
      expect(page).to have_content "hey peeps"
      expect(page).to have_content "peeps 123"
      expect(page).to have_content "peeps back"
    end
  end 