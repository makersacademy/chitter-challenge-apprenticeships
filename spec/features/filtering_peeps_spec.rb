feature 'Filters peeps' do
  scenario 'Should filter and display peeps by keyword provided' do
    add_rows_to_test_database
    visit('/peeps')
    page.fill_in('filter', with: 'first')
    page.click_button('Search')
    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content('User1')
    expect(page).to have_content('15/10/2021')
  end

  scenario 'Should filter and display peeps by keyword provided - regardless of letter casing' do
    add_rows_to_test_database
    visit('/peeps')
    page.fill_in('filter', with: 'this')
    page.click_button('Search')
    expect(page).to have_content('This is my first peep!')
    expect(page).to have_content('This is my second peep!')
    expect(page).to have_content('User1')
    expect(page).to have_content('15/10/2021')
  end
end