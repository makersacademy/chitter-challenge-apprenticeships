# frozen_literal_string: true

require 'cheep'

RSpec.describe Cheep do
  describe '#DB connection works' do
    it '- returns a valid connection to the database' do

      expect(Cheep.db_connection).to be_an_instance_of(PG::Connection)
    end

    it '- switches with the environment variable change' do
      add_row_to_test_database
      ENV['ENVIRONMENT'] = 'not test'
      result = Cheep.db_connection.exec("SELECT * FROM cheeps;")
      expect(result[0]['message']).to_not include "This is a test cheep!"

      ENV['ENVIRONMENT'] = 'test'
      result = Cheep.db_connection.exec("SELECT * FROM cheeps;")
      expect(result[0]['message']).to include "This is a test cheep!"
    end
  end


  describe 'able to access the data in database' do
    it '- connection returns the table data' do
      result = Cheep.db_connection.exec("SELECT * FROM cheeps;")

      expect(result).to be_an_instance_of(PG::Result)
    end
  end

  describe 'able to insert data into the database' do
    it '- returns the data added to database' do
      result = Cheep.db_connection.exec("INSERT INTO cheeps(message) VALUES
        ('This is a test cheep!') RETURNING message;")

      expect(result[0]['message']).to eq 'This is a test cheep!'
    end
  end

  describe 'Testing add_row_to_test_database helper' do
    it '- returns the data added to the database' do

      expect(add_row_to_test_database[0]['message']).to eq 'This is a test cheep!'
    end
  end

  describe 'able to delete data from the database' do
    it '- returns the data deleted from the database' do
      id = add_row_to_test_database[0]['id']
      result = Cheep.db_connection.exec("DELETE FROM cheeps WHERE id='#{id}' RETURNING id, message;")

      expect(result[0]['id']).to eq id
      expect(result[0]['message']).to eq 'This is a test cheep!'
    end
  end

  describe 'able to get the date of a post' do
    it '- returns the date from the database' do
      id = add_row_to_test_database[0]['id']
      result = Cheep.db_connection.exec("SELECT * FROM cheeps;")

      expect(result[0]['date_post']).to match(/\d\d\d\d-\d\d-\d\d/)
      expect(result[0]['id']).to eq id
    end
  end
end
