feature 'Viewing messages' do
  scenario 'A user can see messages' do
    add_row_to_test_database
    visit '/messages'
    expect(page).to have_content('This is a peep!') 
  end
end