feature "Creating peeps" do
  scenario "user adds a new peep" do
    visit "/peeps"
    click_button "Peep!"

    expect(page).to have_content "Username"

    fill_in :username, with: "LouiseB"
    fill_in :message, with: "My hat is the best"
    click_button "Add Peep"

    expect(page).to have_content "My hat is the best"
  end
end
