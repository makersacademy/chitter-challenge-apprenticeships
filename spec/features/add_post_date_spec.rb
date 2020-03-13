feature 'make new peeps' do 
	scenario 'add new peep' do 
		visit '/posts/new'
		fill_in('message', with:'Fill the blank: I am a natural ___')
		click_button 'Post'
		expect(page).to have_content 'Date posted: '
	end
end