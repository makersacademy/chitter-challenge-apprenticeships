feature 'Viewing messages' do
    scenario 'A user can see messages' do
      connection = PG.connect(dbname: 'chitter_test')

      Message.create(message: "Hello, first message!")
      Message.create(message: "It is raining!")
      Message.create(message: "Today is Friday!")
      
      visit('/messages')
  
      expect(page).to have_content "Hello, first message!"
      expect(page).to have_content "It is raining!"
      expect(page).to have_content "Today is Friday!"
    end
end
