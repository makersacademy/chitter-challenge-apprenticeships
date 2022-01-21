feature 'Can view all peeps' do
  scenario 'User loads home route' do
    add_row_to_test_database('First Message')
    add_row_to_test_database('Second Message')
    add_row_to_test_database('Third Message')

    visit '/'

    expect(page).to have_content 'First Message'
    expect(page).to have_content 'Second Message'
    expect(page).to have_content 'Third Message'
  end
end