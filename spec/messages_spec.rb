require 'messages'
require 'pg'

RSpec.describe Messages do 
  describe '.all' do
    it 'returns a list of messages' do
    connection = PG.connect(dbname: 'chitter_test')

    connection.exec("INSERT INTO peeps (message) VALUES ('Hello');")
    connection.exec("INSERT INTO peeps (message) VALUES('Hi!');")
    connection.exec("INSERT INTO peeps (message) VALUES('Hiya.');")
    messages = Messages.all
  
    expect(messages).to include "Hello"
    expect(messages).to include "Hi!"
    expect(messages).to include "Hiya."
    expect(messages.length).to eq 3
    end
  end
end 



# RSpec.describe Bookmark do 
#   describe '.all' do
#     it 'returns a list of peeps' do
#       connection = PG.connect(dbname: 'bookmark_manager_test')
   
#       bookmark = Bookmark.create(message: "http://www.makersacademy.com", title: "Makers Academy")
#       Bookmark.create(message: "http://www.destroyallsoftware.com", title: "Destroy All Software")
#       Bookmark.create(message: "http://www.google.com", title: "Google")
   
#       peeps = Bookmark.all
   
#       expect(peeps.length).to eq 3
#       expect(peeps.first).to be_a Bookmark
#       expect(peeps.first.id).to eq bookmark.id
#       expect(peeps.first.title).to eq 'Makers Academy'
#       expect(peeps.first.message).to eq 'http://www.makersacademy.com'
#      end
#    end

#    describe '.create' do
#     it 'creates a new bookmark' do
#       bookmark = Bookmark.create(message: 'http://www.example.org', title: 'Test Bookmark')
#       persisted_data = persisted_data(id: bookmark.id)
  
#       expect(bookmark).to be_a Bookmark
#       expect(bookmark.id).to eq persisted_data['id']
#       expect(bookmark.title).to eq 'Test Bookmark'
#       expect(bookmark.message).to eq 'http://www.example.org'
#     end
#   end

#   describe '.delete' do 
#     it 'deletes the given bookmark' do 
#       bookmark = Bookmark.create(title: 'Makers Academy', message: 'http://www.makersacademy.com')

#       Bookmark.delete(id: bookmark.id)

#       expect(Bookmark.all.length). to eq 0
#     end
#   end 

#   describe '.update' do
#     it 'updates the bookmark with the given data' do
#       bookmark = Bookmark.create(title: 'Makers Academy', message: 'http://www.makersacademy.com')
#       updated_bookmark = Bookmark.update(id: bookmark.id, message: 'http://www.snakersacademy.com', title: 'Snakers Academy')
  
#       expect(updated_bookmark).to be_a Bookmark
#       expect(updated_bookmark.id).to eq bookmark.id
#       expect(updated_bookmark.title).to eq 'Snakers Academy'
#       expect(updated_bookmark.message).to eq 'http://www.snakersacademy.com'
#     end
#   end

#   describe '.find' do 
#     it 'returns the requested bookmark object' do 
#       bookmark = Bookmark.create(title: 'Makers Academy', message: 'http://www.makersacademy.com')

#       result  = Bookmark.find(id: bookmark.id)

#       expect(result).to be_a Bookmark 
#       expect(result.id).to eq bookmark.id
#       expect(result.title).to eq 'Makers Academy'
#       expect(result.message).to eq 'http://www.makersacademy.com'
#     end
#     end
# end
