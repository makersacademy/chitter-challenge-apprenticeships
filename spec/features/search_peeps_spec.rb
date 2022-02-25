
feature 'search by keyword' do
  scenario 'it filters by keyword' do
    add_peep('breaking news', 'I made eggs today')
    add_peep('monkey_puzzle_tree_654', 'I love breaking news')
    add_peep('aspiring_romeo', "I'm famous for breaking hearts")
    add_peep('CBB News', 'Breaking news: something happened')

    fill_in 'search_keyword', with: 'breaking news'
    click_button 'Search'

    expect(page).to have_content 'CBB News'
    expect(page).to have_content 'Breaking news: something happened'
    expect(page).to have_content 'monkey_puzzle_tree_654'
    expect(page).to have_content 'I love breaking news'
    expect(page).not_to have_content 'I made eggs today'
    expect(page).not_to have_content 'aspiring_romeo'
    expect(page).not_to have_content "I'm famous for breaking hearts"
  end
end
