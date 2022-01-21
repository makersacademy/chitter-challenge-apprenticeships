feature 'viewing peeps' do
  scenario 'visiting the index page' do
    add_row_to_test_database('view_peeps_spec test message')
    visit '/'
    expect(page).to have_content('view_peeps_spec test message')
  end
end
