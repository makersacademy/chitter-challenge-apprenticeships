require 'peeping'

describe Tweet do 

  it 'it views all peeps' do 
		expect(Tweet.all.class). to eq Array
  end
  
	it 'creates peeps' do 
		tweet = Tweet.new('Im peeping', '14.11.1988')
		expect(tweet.message).to eq 'Im peeping'
		expect(tweet.date).to eq '14.11.1988'
  end
  
end 
