require 'test_helper'

feature 'make new peeps' do 
	scenario 'add new peep' do 
		create_new_post('yo')
		expect(page).to have_content 'yo'
	end
end