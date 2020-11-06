feature 'User can post to the page' do
  scenario 'user has the option to add a message' do
    visit "/Chitter"
    expect(page).to have_selector(:button, 'Add a peep')
  end
  scenario 'expect the peep to be added to the Chitter page' do
    visit "/Chitter"
    fill_in :name, with: "Joe"
    fill_in :peep, with: "This is my first post"
    click_button 'Add a peep'
    name = "Joe"
    peep = "This is my first post!"
    expect(page).to have_content "#{name} - #{peep}"
  end
end
