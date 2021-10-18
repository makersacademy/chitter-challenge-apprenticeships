feature 'Search peeps by keyword' do
  scenario 'visiting the index page and reversing order of peeps' do
    visit('/')
    # Add peep with 'peep' in message
    click_button "Add peep"
    fill_in("message", with: "New peep added by feature test!")
    click_button "Submit peep"
    
    # Add peep without 'peep' in message
    click_button "Add peep"
    fill_in("message", with: "New message added by feature test!")
    click_button "Submit peep"

    fill_in("filter", with: "peep")
    click_button "Filter"
    expect(page).to have_content("New peep added by feature test!")
    expect(page).to_not have_content("New message added by feature test!")
  end
end