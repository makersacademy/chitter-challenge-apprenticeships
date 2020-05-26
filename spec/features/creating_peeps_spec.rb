feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'LMNOP is truly the party zone of the alphabet.')
    click_button('Submit')

    expect(page).to have_content 'LMNOP is truly the party zone of the alphabet.'
  end
end
