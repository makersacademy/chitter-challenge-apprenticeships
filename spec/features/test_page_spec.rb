feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end

feature 'View all messages' do
  scenario 'visit message route' do
    add_row_to_test_database
    visit('/messages')
    expect(page).to have_content "This is a peep!"
  end
end

