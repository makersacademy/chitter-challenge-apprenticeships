require './lib/peeps'
require 'pg'


RSpec.describe Peeps do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'chitter_test')

      Peeps.create(message: 'Test 1')
      Peeps.create(message: 'test')
      Peeps.create(message: 'test')

      peeps = Peeps.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.message).to eq 'Test 1'
    end
  end


  describe '.create' do
    it 'creates a new message' do
      peeps = Peeps.create(message: 'test')
      expect(peeps).to be_a Peeps
      expect(peeps.message).to eq 'test'
    end
  end



  describe '.date' do
    it 'creates a new message' do
      peeps = Peeps.create(message: 'test')
      expect(peeps).to be_a Peeps
      expect(peeps.add_date).to eq '2020-05-22'
    end
  end

  describe '.find' do
    it 'creates a new message' do
      peeps = Peeps.create(message: 'test')
      Peeps.create(message: 'test dev')
      Peeps.create(message: 'test user ')

      peeps = Peeps.find(keyword: 'dev')
      
      expect(peeps.first).to be_a Peeps
      expect(peeps.first.message).to eq 'test dev'
    end
  end




end 



