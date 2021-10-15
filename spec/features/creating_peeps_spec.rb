feature "posting a new peep" do
  scenario "A user can add a peep to Chitter" do
    visit("/peeps/new")
    fill_in("message", with: "this is an example")

    click_button("Continue")

    expect(page).to have_content("this is an example")
  end
end
