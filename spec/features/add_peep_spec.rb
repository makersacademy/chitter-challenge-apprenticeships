feature 'Adding peep' do
  scenario 'Clicking the add peep button and submitting a peep' do
    visit('/')
    click_button "Add peep"
    fill_in("message", with: "New peep added by feature test!")
    click_button "Submit peep"
    expect(page).to have_content "New peep added by feature test!"
  end
end
