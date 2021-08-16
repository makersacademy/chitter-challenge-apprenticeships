feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/new')
    fill_in('message', with: 'Peep this!')
    click_button('Submit')

    expect(page).to have_content 'Peep this!'
  end
end