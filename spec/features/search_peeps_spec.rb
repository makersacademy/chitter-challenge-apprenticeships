feature "Searching for specific peeps" do
  scenario "there is a search bar for user input" do
    visit "/peeps"
    expect(page).to have_field("search_peeps")
  end

  scenario "users can search for peeps using keywords" do
    visit "/peeps"
    click_button "Peep!"

    fill_in :username, with: "LouiseB"
    fill_in :message, with: "My hat is the best"
    click_button "Add Peep"

    click_button "Peep!"
    fill_in :username, with: "GeneB"
    fill_in :message, with: "I play the keyboard really well"
    click_button "Add Peep"

    fill_in :search_peeps, with: "keyboard"
    click_button "Search Peeps"

    expect(page).not_to have_content "My hat is the best"
    expect(page).to have_content "I play the keyboard really well"
  end
end
