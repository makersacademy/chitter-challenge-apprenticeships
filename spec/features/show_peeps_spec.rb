#feature 'Viewing test page' do
  #scenario 'visiting the test page' do
#  visit('/test')
    #expect(page).to have_content "Test page"
  #end
#end
require 'pg'
feature 'Shows all peeps in database' do
 scenario 'user presses a button and it shows peeps' do
   visit ('/')
   click_button('show all')
   #expect(page.current_path).to eq('/')

   #Peeps.create(peep: 'here is a new peep')
   visit ('/all')
   expect(page).to have_content "This is a peep!"
   expect(page).to have_content "here is a new peep"
 end
end
#eature 'sort peeps according to date'
#scenario 'user presses button to sort accoring to date' do
  #visit('/')
  #click_button
