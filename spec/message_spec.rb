describe Message do 
  describe '.all'
    it 'returns all messages' do 
      
      # setup_test_database and add_row_to_test_database are automatically run when the test runs

      # Add test data
      
      messages = Message.all
      
      expect(messages).to include('Working with the test database')
      expect(messages).to include('Adding test data within the tests')
      expect(messages).to include('Saved as variable to instantiated Message class')
  end 
end 