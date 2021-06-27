feature 'View all peeps' do
  scenario 'A user can see all peeps in browser' do
    Peep.create(message: 'This is a peep!')
    Peep.create(message: 'Welcome to Chitter!')
    Peep.create(message: 'My first peep!')

    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "Welcome to Chitter!"
    expect(page).to have_content "My first peep!"
  end

end