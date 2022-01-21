feature 'Create Peep' do
  scenario 'add a peep and see it on the main page' do
    visit('/new')
    fill_in('message', with: 'This is a Peep')
    click_button('Peep it!')
    expect(page).to have_content 'This is a Peep'
  end
end
