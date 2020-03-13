def create_new_post(message)
	visit '/posts/new'
	fill_in('message', with: message)
	click_button 'Post'
end