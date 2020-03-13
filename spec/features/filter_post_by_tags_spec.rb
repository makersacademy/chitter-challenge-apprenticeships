require 'test_helper.rb'

feature 'filter posts by tags' do 
	scenario 'types in a key word in search' do
		create_new_post("Is lana del rey Swiss?")
		create_new_post("Wagamama is not Japanese bruv")
		visit '/posts/search'
		fill_in('keywords', with: 'lana del rey')
		click_button 'Search'
		expect(page).to have_content 'Is lana del rey Swiss?'
		expect(page).to have_no_content 'Wagamama is not Japanese bruv'
	end
end