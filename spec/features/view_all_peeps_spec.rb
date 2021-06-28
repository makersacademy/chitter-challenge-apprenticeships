require 'pg'
# As a Maker
# So that I can see what people are doing
# I want to see all the messages (peeps)
# in a browser
feature 'View all messages' do 
	 scenario 'A Maker can view all the peeps' do 
 		
 		 Peep.create(message: 'Thinking about what to have for dinner')
 		 Peep.create(message: 'Please share what books you are reading atm')
 		 Peep.create(message: 'HELLEW!')

 		 visit('/peeps')

 		 expect(page).to have_content 'Thinking about what to have for dinner'
 		 expect(page).to have_content 'Please share what books you are reading atm'
 		 expect(page).to have_content 'HELLEW!'
 	end
end
