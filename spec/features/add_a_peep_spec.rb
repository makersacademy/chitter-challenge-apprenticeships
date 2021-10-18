feature 'Add peep' do
  it 'should add a peep to the database' do
    visit("/")
    click_button "Add Peep" # go to /add_peep

    expect(page).to have_field("peep")

    fill_in("peep", with: "Chitter is cool!")
    click_button "Submit"
    expect(page).to have_content("Chitter is cool!")
  end
end