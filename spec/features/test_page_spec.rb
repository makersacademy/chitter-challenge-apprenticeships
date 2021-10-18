feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end
  feature 'Home screen' do
    scenario ' adding a peep' do
      visit('/')
      fill_in('Uname', with: 'Joe')
      fill_in('message', with: 'Hello there')
      click_button "Submit"
      expect(page).to have_content("Joe")
    end
  end

