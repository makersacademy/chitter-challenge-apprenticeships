feature "new peeps page" do 
  scenario "able to submit a new peep" do 
    visit '/peeps/new'

    expect(page).to have_content("This is the test peep for the new peep page.")
  end 
end 