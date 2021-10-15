feature 'Viewing peeps' do
    scenario 'A user can see all messages in browser ' do

        Peeps.create(message: "peep1")
        Peeps.create(message: "peep2")
        Peeps.create(message: "peep3")
          

       

        visit('/messages')
  
        expect(page).to have_content "peep1"
        expect(page).to have_content "peep2"
        expect(page).to have_content "peep3"
    end
  end 

  feature 'Adding a new message' do
    scenario 'A user can add a peep to chitter' do
      visit('/messages/new')
      fill_in('message', with: 'peep1')
      click_button('Submit')
  
      expect(page).to have_content 'peep1'
    end
  end