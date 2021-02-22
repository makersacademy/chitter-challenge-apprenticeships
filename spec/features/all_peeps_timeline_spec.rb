require 'setup_test_database'

feature 'timeline' do
  scenario 'A user is able to see all the peeps on the in a browser' do
    add_row_to_test_database
    visit '/'
    expect(page).to have_content 'Just setting up my chttr.'
  end
end