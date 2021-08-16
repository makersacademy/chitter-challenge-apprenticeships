feature 'User is directed to the home page' do
    scenario 'A user can see the home page' do
      visit('/')
      expect(page).to have_content('Chitter') 
     end
  end  

feature 'Adding a new chitter post' do
    scenario 'A user can add a message(peep) to chitter' do
      visit('/')
      fill_in('post', with: 'A test post by Joe Bloggs')
     
      expect(page).to have_button('Add Post') 
     end
  end  

  feature 'Adding a new chitter post' do
    scenario 'A user submits the new post and sees new screen' do
      visit('/')
      fill_in('post', with: 'A test post by Joe Bloggs')
      click_button('Add Post')
      expect(page).to have_content('A test post') 
     end
  end  

  feature 'User is directed to the filter page' do
    scenario 'A user can see the filter page' do
      visit('/filter')
      expect(page).to have_button('Add filter')
     end
  end 

  feature 'User is enters their filter and gets list' do
    scenario 'A user can see the filter page' do
      visit('/filter')
      fill_in('filter', with: "A marvellous day at the office")
      click_button('Add filter')
      expect(page).to have_content 'Filtered List'
     end
  end 

  feature 'views filtered list' do
    scenario 'clicks on return to main screen' do
      visit('/filter')
      fill_in('filter', with: "test")
      click_button('Add filter')
      click_button('Return to main screen')
      expect(page).to have_content 'Chitter main screen'
     end
  end 