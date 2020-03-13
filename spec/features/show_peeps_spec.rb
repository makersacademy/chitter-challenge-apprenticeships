#feature 'Viewing test page' do
  #scenario 'visiting the test page' do
#  visit('/test')
    #expect(page).to have_content "Test page"
  #end
#end
feature 'Shows all peeps in database' do
 scenario 'user presses a button and it shows peeps' do
   visit ('/')
   click_button('show all')
   #expect(page.current_path).to eq('/')
   expect(page).to have_content "peeps"
 end
end
