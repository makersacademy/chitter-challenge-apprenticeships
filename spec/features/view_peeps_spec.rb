feature "peeps page" do 
  scenario "display all peeps" do 
    visit '/peeps'
    expect(page).to have_content("This is my first peep")
  end 
end 