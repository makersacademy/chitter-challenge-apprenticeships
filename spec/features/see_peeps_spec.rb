feature 'peeps page' do
  scenario 'a user can see all the peeps in a browser' do
    connection = PG.connect(dbname: 'chitter_test')

    Peep.add(peep: 'This is a peep!')
    Peep.add(peep: 'And this is a peep!')
    Peep.add(peep: 'And this is a peep too!')

    visit '/peeps'
    
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "And this is a peep!"
    expect(page).to have_content "And this is a peep too!"
  end
end