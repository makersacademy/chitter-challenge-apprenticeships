feature 'Viewing messages' do

    scenario 'A user can see comments' do

      connection = PG.connect(dbname: 'chitter_test')
  
      Peeps.create(message: 'Test 1')
      Peeps.create(message: 'test 2')
      Peeps.create(message: 'test')
  
      visit '/'
  
      expect(page).to have_content('Test 1')
      expect(page).to have_content('test 2')
      expect(page).to have_content('test')
      
      
    end
  
  end