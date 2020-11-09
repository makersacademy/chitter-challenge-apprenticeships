# As a Maker
# So that I can easily see the latest peeps
# I want to see a list of peeps in reverse chronological order

feature 'list of peeps in reverse chronological order' do
  scenario 'when visiting /peeps' do
    add_2_rows_to_test_database()
    visit('/peeps/add')
    fill_in('message', with: 'This is yet another peep!')
    click_button('Submit')

    expect("This is yet another peep!").to appear_before("This is a peep!", only_text: true)
    expect("This is a peep!").not_to appear_before("This is yet another peep!", only_text: true)
    # expect(newest).to appear_before(oldest)
  end
end
