require 'setup_test_database'

feature 'filter' do
  scenario 'A user is able to filter by a specific keyword' do
    add_row_to_test_database
    visit '/'
    fill_in :search, with: 'chttr'
    click_button 'Search'

    expect(page).to have_content 'Just setting up my chttr.'
  end

  scenario 'A user is able to filter from more than one peep' do
    add_row_to_test_database
    Peeps.add(peep: 'Did you know manos means hands in Spanish?')
    visit '/'

    expect(page).to have_content 'Just setting up my chttr.'
    expect(page).to have_content 'Did you know manos means hands in Spanish?'

    fill_in :search, with: 'manos'
    click_button 'Search'

    expect(page).not_to have_content 'Just setting up my chttr.'
    expect(page).to have_content 'Did you know manos means hands in Spanish?'
  end
end