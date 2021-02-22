require 'setup_test_database'

feature 'Posting a new peep' do
  scenario 'A user is able to post a new peep to the timeline' do
    add_row_to_test_database
    visit '/'
    fill_in :peep, with: 'inviting my co-makers'
    click_button 'Submit'
    expect(page).to have_content 'Just setting up my chttr.'
    expect(page).to have_content 'inviting my co-makers'
  end
end