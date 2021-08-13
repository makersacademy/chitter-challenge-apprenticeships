feature "peeps page" do 
  scenario "display all peeps" do 
    visit '/peeps'
    expect(page).to have_content('This is a peep!') #This peep is hardcoded into test env
  end 
end 