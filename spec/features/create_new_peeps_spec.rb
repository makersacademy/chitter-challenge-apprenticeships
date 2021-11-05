feature 'Can create new peeps' do
  scenario 'A user can create a new peep' do
    visit('chitter/newpeep')
    fill_in('peep', with: 'This is my dummy peep')
    click_button('Peep')
    
    expect(page).to have_content('This is my dummy peep')
  end
end