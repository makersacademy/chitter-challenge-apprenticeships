feature 'Filter keyword' do
  scenario 'A user can navigate to the filter page using a button' do
    visit('/newsfeed')
    click_button('Filter')

    expect(current_path).to eq('/newsfeed/filter')
  end

  scenario 'A user can filter peeps by keyword' do
    visit('/newsfeed/filter')
    fill_in('filter', with: 'Filter')
    click_button('Submit')

    expect(page).to have_content('Filter test!')
    expect(page).not_to have_content('This is a peep!')
  end
end
