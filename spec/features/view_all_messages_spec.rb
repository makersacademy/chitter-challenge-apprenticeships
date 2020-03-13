feature 'Viewing all messages' do 
	scenario 'visit posts page' do 
		visit '/posts'
		page.should have_content 'This is a peep!'
	end
end