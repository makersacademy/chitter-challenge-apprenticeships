feature 'display all messages' do
  scenario 'can display messages on page' do
    add_row_to_test_database('Test peep')
    visit('/')
    expect(page).to have_content 'Test peep'
  end
end
