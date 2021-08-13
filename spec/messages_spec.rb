require 'messages.rb'

describe Messages do
  it 'can store the text and whenposted date of a post' do
    message = Messages.create(post: 'A test post: for fun')
      
    expect(message[:post]).to eq('A test post: for fun')
  end
end