require 'pg'
# As a Maker
# So that I can let people know what I am doing  
# I want to post a message (peep) to chitter
feature 'Posting a new peep' do 
	 scenario 'A Maker can share a new peep on chitter' do 

 		 visit('/peeps')

 		 fill_in('message', with: 'Peep Of The Day')
 		 click_button('Share')
 		 expect(page).to have_content 'Peep Of The Day'
 	
 	end
end
