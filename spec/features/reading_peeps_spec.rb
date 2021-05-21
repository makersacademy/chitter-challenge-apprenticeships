feature 'viewing all peeps' do
  scenario 'a user can see all the posted peeps' do
    setup_test_database
    add_row_to_test_database
    visit ('/peeps')
    expect(page).to have_content 'This is a peep!'
  end
end
