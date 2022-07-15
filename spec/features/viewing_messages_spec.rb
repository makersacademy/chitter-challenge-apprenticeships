feature 'viewing messages' do
  scenario 'visiting the index page' do
    visit('/')

    expect(page).to have_content "Chitter"
  end
  
  scenario 'a user can see messages' do
    Peep.add(message: 'This is a peep!')
    Peep.add(message: 'This is also a peep!')
    Peep.add(message: 'This is a third peep!')
    
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is also a peep!"
    expect(page).to have_content "This is a third peep!"
  end
end
