feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end

feature 'show all message' do 
  scenario 'visiting the test page' do
    visit('/')
    expect(page).to have_content "Peeps"
  end
end 

feature 'Adding a new message' do
  scenario 'A user can add a message' do
    visit('/')
    fill_in('message', with: 'this is beep 2')
    click_button('Submit')
    expect(page).to have_content 'this is beep 2'
  end
end
 
