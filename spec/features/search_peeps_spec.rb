feature "Searching for specific peeps" do
  before(:each) do
    visit "/peeps"
  end
  
  scenario "there is a search bar for user input" do
    expect(page).to have_field("search_peeps")
  end

  scenario "users can search for peeps using keywords" do
    fill_in :username, with: "LouiseB"
    fill_in :message, with: "My hat is the best"
    click_button "Peep some Chit!"

    fill_in :username, with: "GeneB"
    fill_in :message, with: "I play the keyboard really well"
    click_button "Peep some Chit!"

    fill_in :search_peeps, with: "keyboard"
    click_button "Search Peeps"

    expect(page).not_to have_content "My hat is the best"
    expect(page).to have_content "I play the keyboard really well"
  end
end
