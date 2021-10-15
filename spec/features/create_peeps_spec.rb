feature "Creating peeps" do
  scenario "There is a form through which users can submit input" do
    visit "/peeps"
    click_button "Peep!"

    expect(page).to have_content "Username"
    expect(page).to have_content "Peep"
    expect(page).to have_field("username")
    expect(page).to have_field("message")
    expect(page).to have_selector(:link_or_button, "Add Peep")
  end

  scenario "Users can add a new peep" do
    visit "/peeps"
    click_button "Peep!"

    fill_in :username, with: "LouiseB"
    fill_in :message, with: "My hat is the best"
    click_button "Add Peep"

    expect(page).to have_content "My hat is the best"
  end
end
