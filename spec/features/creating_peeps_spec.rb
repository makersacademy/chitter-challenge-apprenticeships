feature 'Adding a new peep' do
  scenario 'A user can add a message to chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Hey, I want to join you guys')
    click_button('Submit')

    expect(page).to have_content 'Hey, I want to join you guys'
  end
end 
