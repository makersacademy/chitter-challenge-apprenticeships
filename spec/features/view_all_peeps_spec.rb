feature 'View all peeps (messages): ' do
  scenario 'can see all the peeps (messages) in a browser' do
    visit '/peeps'
    expect(page).to have_content("Hello, this is a new peep!")
  end
end
