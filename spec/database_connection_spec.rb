describe DatabaseConnection do
  describe '#start' do
    it 'connect to the database' do
      connection = DatabaseConnection.start
      expect(connection).to be_a PG::Connection 
      expect(connection.db).to eq 'chitter_test' 
    end
  end
end