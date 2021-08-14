feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/home/post')
    fill_in('message', with: 'Good morning world!')
    click_button('Peep')

    expect(page).to have_content 'Good morning world!'
  end
end