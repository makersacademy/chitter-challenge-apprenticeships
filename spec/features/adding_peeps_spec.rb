feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/chitter/new')
    fill_in('peep', with: 'This is a test peep')
    click_button('Submit')

    expect(page).to have_content 'This is a test peep'
  end
end
