feature 'filtered peep' do
  it 'should add a peep to the database' do
    visit("/")
    click_button "Filter Peeps" # go to /filter_peeps GET

    expect(page).to have_field("keyword")

    fill_in("keyword", with: "boiled")
    click_button "Submit"
    expect(page).to have_content("I love boiled eggs!")
  end
end