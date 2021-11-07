require 'date'
feature 'Listing all peeps page' do
  scenario 'has today\'s date' do
    visit('/')
    expect(page).to have_content (Date.today - 3).strftime("%Y-%m-%d")
  end
end
