require 'date'
feature 'Listing all peeps page' do
  scenario 'has headers' do
    visit('/')
    expect(page).to have_content "Peep"
  end
  scenario 'lists all peeps' do
    visit('/')
    expect(page).to have_content "This is Peep"
  end
end
