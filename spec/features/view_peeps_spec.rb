require 'pg'
feature "view peeps" do
  
  scenario "user wants to view the peeps" do

    
    
    visit '/peeps'

    

    expect(page).to have_content "hi"
    expect(page).to have_content "how r u"
    expect(page).to have_content "bye"
  
  end
end