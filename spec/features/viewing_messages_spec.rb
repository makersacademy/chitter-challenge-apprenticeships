feature 'viewing messages' do
  scenario 'visiting the index page' do
    visit('/')
    
    expect(page).to have_content "Chitter"
  end
  
  scenario 'a user can see messages' do
    visit('/peeps')

    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is also a peep!"
    expect(page).to have_content "This is a third peep!"
  end
end
