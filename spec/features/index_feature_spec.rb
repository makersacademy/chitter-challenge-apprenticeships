feature 'Webpage displays content correctly' do
  scenario 'index displays title of Peeps' do
    visit '/'
    expect(page).to have_content("Peeps:")
  end

  scenario 'index has a new peep button' do
    visit '/'
    expect(page).to have_button("New Peep")
  end

  scenario 'index has a filter button' do
    visit '/'
    expect(page).to have_button("Filter")
  end

  scenario 'message added to database is displayed to user' do
    add_row_to_test_database
    visit '/'
    expect(page).to have_content("This is a peep!")
  end
end

feature "Displays peep and date entered by user" do
  scenario 'adding peeps to index page' do
    visit('/')
    click_on 'New Peep'
    fill_in "message", with: 'Test peep'
    click_button 'Submit'
    expect(page).to have_content("Test peep: #{Time.now.strftime("%Y-%m-%d")}")
  end
end
