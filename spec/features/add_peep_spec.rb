feature 'Adding a peep' do
  scenario 'Adds peep to chitter page' do
    visit('/add')
    fill_in('message', with: 'Hello Chitter!')
    click_button('Submit')
    
    expect(page).to have_content 'Hello Chitter!'
  end
end