require 'messages.rb'

describe Messages do
  it 'can store the text of a post' do
    message = Messages.create(post: 'A test post for fun')
    expect(Messages.all[0][0]).to include("A test post for fun")
  end
end

describe Messages do
  it 'can retrieve all the posts and when posted dates sent to a db' do
    connection = PG.connect(dbname: 'chitter_test')
    post = Messages.create(post: "My first post by Joe Bloggs")
    post2 = Messages.create(post: "My second post by Joe Bloggs")
    post3 = Messages.create(post: "My first post by anonymous")
    posts = Messages.all
   
    expect(Messages.all[0][0]).to include('My first post by anonymous')
  end
end


