feature 'New poop' do
  scenario 'User can create a new poop' do
    visit '/poops/new'
    fill_in 'message', with: 'This is a new poop!'
    click_button 'Poop!'
    expect(page).to have_content 'This is a new poop!'
  end
end