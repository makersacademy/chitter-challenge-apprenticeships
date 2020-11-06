feature 'Adds a new peep' do
  scenario 'when the maker visits /peeps/add' do
    visit('/peeps/add')
    fill_in('message', with: 'This is yet another peep!')
    click_button('Submit')
    expect(page).to have_content 'This is yet another peep!'
  end
end
