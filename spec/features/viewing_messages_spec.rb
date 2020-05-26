feature 'Viewing messages' do
  scenario 'A user can see the messages' do
    connection = PG.connect(dbname: 'chitter_test')

    #don't forget to add test data
    Messages.create(message: 'This is a peep!', date_posted: '#{date_posted}')
    Messages.create(message: 'This is another peep!', date_posted: '#{date_posted}')
    Messages.create(message: 'More peeping!', date_posted: '#{date_posted}')

    visit('/messages')
    save_and_open_page
    expect(page).to have_content('This is a peep!')
    expect(page).to have_content('This is another peep!')
    expect(page).to have_content('More peeping!')
  end
end
