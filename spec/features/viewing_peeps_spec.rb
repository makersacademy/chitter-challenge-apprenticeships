require 'peep'

feature 'Viewing peeps' do
  scenario 'Viewing a list of peeps' do
    Peep.create(message: "Test peep!")
    visit('/peeps')
    expect(page).to have_content "Test peep!"
  end
end

feature 'Posting a peeps' do
  scenario 'User can post a peep' do
    Peep.create(message: "Test peep!")
    visit('/peeps')
    fill_in :message, with: 'Test peep!'
    click_button 'Submit'
    expect(page).to have_content "Test peep!"
  end
end