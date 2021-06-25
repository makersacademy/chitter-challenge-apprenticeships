feature 'Index page' do
  scenario 'index page displays peeps' do
    add_row_to_test_database
    visit '/'
    expect(page).to have_content "This is a peep!"
  end
end

