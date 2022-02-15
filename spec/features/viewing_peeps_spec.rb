feature 'Viewing peeps' do

  scenario 'viewing all peeps in browser' do
    add_row_to_test_database
    visit('/')
    expect(page).to have_content "This is a peep!"
  end

  scenario 'viewing all peeps in browser' do
    add_row_to_test_database
    visit('/')
    expect(page).to have_content "This is a peep!"
  end

end
