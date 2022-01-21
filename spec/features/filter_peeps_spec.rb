feature 'Can view peeps that contain a phrase' do
  scenario 'User submits a keyword' do
    add_row_to_test_database('First Message')
    add_row_to_test_database('Second Message')
    add_row_to_test_database('Third Message')

    visit '/'

    fill_in 'keyword', with: 'Second'
    click_button 'Search'

    expect(first('.peep')).to have_content 'Second Message'
  end
end