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

