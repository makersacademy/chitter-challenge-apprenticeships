require 'pg'

feature 'Posting a new peep' do 
	scenario 'A user can post new message on chitter' do 
		visit('/peeps')
		fill_in('message', with: 'TGIF!! Thank God its FriYAY!')
		click_button('Share!')
		expect(page).to have_content 'TGIF!! Thank God its FriYAY!'
	
	end
end