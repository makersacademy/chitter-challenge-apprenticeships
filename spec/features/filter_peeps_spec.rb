feature 'Filtering peeps by keyword' do
  scenario 'page has input field for keyword' do
    visit('/')
    expect(page).to have_field 'keyword'
  end

  scenario 'user can filter peeps by keyword' do
    add_row_to_test_database('Snape. Snape. Severus Snape...')
    add_row_to_test_database('Always wanted to get a black cat, and name it Snowflake.')
    add_row_to_test_database('Hi there!')
    add_row_to_test_database('It\'s raining cats and dogs outside!')

    visit('/')
    fill_in :keyword, with: 'cat'
    click_button 'find'
    
    expect(page.all('.peep').length).to eq 2
    expect(page).to have_content 'Always wanted to get a black cat, and name it Snowflake.'
    expect(page).to have_content 'It\'s raining cats and dogs outside!'
  end
end
