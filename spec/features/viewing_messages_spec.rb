feature 'viewing messages' do
  scenario 'visiting the index page' do
    visit('/')

    expect(page).to have_content "Chitter"
  end
  
  scenario 'a user can see messages' do
    Peep.add(message: 'This is a peep!', date: '2022-07-15')
    Peep.add(message: 'This is also a peep!', date: '2022-07-10')
    Peep.add(message: 'This is a third peep!', date: '2022-07-05')
    
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is also a peep!"
    expect(page).to have_content "This is a third peep!"
  end
end
