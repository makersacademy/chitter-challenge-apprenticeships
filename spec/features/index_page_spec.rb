feature 'Chitter' do
  scenario 'index page displays peeps' do
    add_row_to_test_database
    visit '/'
    expect(page).to have_content "This is a peep!"
  end
end

feature 'Chitter' do
  scenario 'index page adds peep' do
    visit '/'
    fill_in('add_peep', with: "Hi everyone")
    click_button('Add')
    expect(page).to have_content "Hi everyone"
  end
end

