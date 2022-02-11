feature 'New peeps' do 
  scenario 'User can create new peep' do 
    add_row_to_test_database

    visit '/peeps/new'
    fill_in "message", with: "This is another peep!"
    click_button "Peep!"

    expect(page).to have_content "This is another peep!"
  end
end
