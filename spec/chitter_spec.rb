require './lib/comments'
require 'pg'


RSpec.describe Comments do

  describe '.all' do
    it 'returns a list of bookmarks' do
      connection = PG.connect(dbname: 'chitter_test')

      Comments.create(message: 'Test 1')
      Comments.create(message: 'test')
      Comments.create(message: 'test')

      peeps = Comments.all

      expect(peeps.length).to eq 3
      expect(peeps.first).to be_a Comments
      expect(peeps.first.message).to eq 'Test 1'
    end
  end

  describe '.create' do
    it 'creates a new message' do
      peeps = Comments.create(message: 'test')
      expect(peeps).to be_a Comments
      expect(peeps.message).to eq 'test'
    end
  end



end

