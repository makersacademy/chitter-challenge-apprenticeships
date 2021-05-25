feature 'Filtering by keywords' do
  scenario 'Allows a user to filter peeps by a keyword' do
    Peeps.create(message: 'A yellow peep')
    Peeps.create(message: 'A blue peep')
    visit '/chitter'
    fill_in('keyword', with: 'yellow')
    click_button('Search')

    expect(page).to have_content 'A yellow peep'
    expect(page).not_to have_content 'A blue peep'
  end
end