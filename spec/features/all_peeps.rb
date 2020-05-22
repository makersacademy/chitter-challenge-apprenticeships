require 'setup_test_database'
feature 'Viewing all peeps' do
  scenario 'visiting /messages and viewing all peeps' do
    add_row_to_test_database
    visit('/messages')
    expect(page).to have_content "This is a peep!"
  end
end

