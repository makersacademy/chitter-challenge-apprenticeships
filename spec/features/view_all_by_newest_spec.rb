feature 'Can view all peeps' do
  scenario 'User loads home route' do
    add_row_to_test_database('First Message')
    add_row_to_test_database('Second Message')
    add_row_to_test_database('Third Message')

    visit '/'

    select 'Newest First', from: 'order'
    click_button 'Sort'

    expect(first('.peep')).to have_content 'Third Message'
  end
end