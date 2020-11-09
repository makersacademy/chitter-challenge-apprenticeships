# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter

feature 'FEATURE: Add a new peep' do
  scenario 'when the maker visits /peeps/add' do
    add_2_rows_to_test_database()
    visit('/peeps/add')
    fill_in('message', with: 'This is yet another peep!')
    click_button('Submit')
    expect(page).to have_content 'This is yet another peep!'
  end
end
