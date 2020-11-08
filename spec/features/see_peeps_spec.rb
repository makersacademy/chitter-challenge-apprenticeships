feature 'peeps page' do
  scenario 'a user can see all the peeps in a browser' do
    visit '/peeps'
    
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "And this is a peep!"
    expect(page).to have_content "And this is a peep too!"
  end
end