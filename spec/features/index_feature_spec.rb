feature 'Webpage displays content correctly' do
  scenario 'index displays title of Peeps' do
    visit '/'
    expect(page).to have_content("Peeps:")
  end

  scenario 'message added to database is displayed to user' do
    add_row_to_test_database
    visit '/'
    expect(page).to have_content("This is a peep!")
  end
end
