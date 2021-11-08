describe Message do 
  describe '.all'
    it 'returns all messages' do 
      connection = PG.connect(dbname: 'chitter_test')

      # Add test data
      connection.exec("INSERT INTO peeps_test (message) VALUES('This is peeps!');")   
      connection.exec("INSERT INTO peeps_test (message) VALUES('Adding test data within the tests');")   
      connection.exec("INSERT INTO peeps_test (message) VALUES('Saved as variable to instantiated Message class');")   


      test_message = Message.all

      # p test_message

      expect(test_message).to include('This is peeps!')
      expect(test_message).to include('Adding test data within the tests')
      expect(test_message).to include('Saved as variable to instantiated Message class')
  end 
end 