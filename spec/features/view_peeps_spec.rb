feature "Timeline View" do
  scenario "view all peeps" do
    visit '/'
    expect(page).to have_content('This is a test peep!')
  end
  scenario "dates shown" do
    visit '/'
    expect(page).to have_content(Date.today)
  end
end
