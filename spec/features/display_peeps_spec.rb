feature 'display peeps' do
  scenario 'navigate to page and list peeps from database' do
    visit '/peeps'
    expect(page).to have_content("This is a peep!")
  end
end
