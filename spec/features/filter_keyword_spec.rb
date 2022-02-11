feature 'Filter keyword' do
  scenario 'A user can filter peeps by keyword' do
    visit('/newsfeed/filter')
    fill_in('filter', with: 'Filter')
    click_button('Submit')

    expect(page).to have_content('Filter test!')
    expect(page).not_to have_content('This is a peep!')
  end
end
