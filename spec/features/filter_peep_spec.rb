# As a Maker
# So that I can find relevant peeps
# I want to filter on a specific keyword

feature 'search for peep by keyword' do
  scenario 'find a peep by searching a specific keyword' do
    add_peep(message: 'This is peep one!')
    add_peep(message: 'This is a peep two!')
    fill_in :keyword, with: 'one'
    click_button 'Search Peeps'

    expect(page).to have_content('This is peep one!')
  end
end
