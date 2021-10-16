describe Database do
  describe '.get_messages and .add_message' do
    it 'returns all added messages' do
      setup_test_database
      add_row_to_test_database
      message = Database.get_messages
      expect(message[0]['message']).to include 'This is a peep!'
    end
  end
end
