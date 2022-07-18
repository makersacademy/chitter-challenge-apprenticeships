feature 'Adding a peep' do
  scenario 'adding a peep' do
    visit('/peeps/add')
    fill_in('peep', with: 'Peep peep!')
    click_button('Post')
    expect(page).to have_content ""
  end
end
