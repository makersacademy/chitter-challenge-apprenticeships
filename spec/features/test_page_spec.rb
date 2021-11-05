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

feature 'show all message' do 
  scenario 'send message' do
    visit('/')
    fill_in :message, with: 'Hello'
    click_button 'Submit'
    expect(page).to have_content 'hello'
  end
end 
