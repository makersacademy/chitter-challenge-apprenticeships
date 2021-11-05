feature 'Viewing messages page' do
  scenario 'All messages in message page' do
    connection = PG.connect(dbname: 'chitter_test')
    setup_test_database
    add_row_to_test_database
    visit('/messages')
    expect(page).to have_content 'This is a peep!'
  end
end
