feature "Creating peeps" do
  before(:each) do
    visit "/peeps"
  end

  scenario "There is a form through which users can submit input" do
    expect(page).to have_content "Username"
    expect(page).to have_content "Peep"
    expect(page).to have_field("username")
    expect(page).to have_field("message")
    expect(page).to have_selector(:link_or_button, "Peep some Chit!")
  end

  scenario "Users can add a new peep" do
    fill_in :username, with: "LouiseB"
    fill_in :message, with: "My hat is the best"
    click_button "Peep some Chit!"

    expect(page).to have_content "My hat is the best"
  end
end
