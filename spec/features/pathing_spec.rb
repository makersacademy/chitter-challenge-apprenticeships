feature 'pathing between routes' do
  scenario 'from homepage user can view all messages' do
    add_row_to_test_database
    visit '/'
    click_button 'View all peeps'

    expect(page).to have_content "This is a peep!"
  end

  scenario 'from homepage user can add a new message' do
    visit '/'
    click_button 'Add a new peep'

    expect(page).to have_content "New peep"
  end

  scenario "from '/peeps' user can add a new message" do
    visit '/peeps'
    click_button 'Add a new peep'

    expect(page).to have_content "New peep"
  end

  scenario "from '/peeps' user can filter messages by keyword" do
    visit '/peeps'
    click_button 'Filter peeps by keyword'

    expect(page).to have_content "Search"
  end

  scenario 'from filtered search results, user can view all messages' do
    Peep.add(message: 'Banana peep', date: '2022-07-15')
    Peep.add(message: 'Apple peep', date: '2022-07-10')
    visit '/peeps/search'
    fill_in('keyword', with: 'banana')
    click_button 'Search'

    click_button 'View all peeps'

    expect(page).to have_content "Apple peep"
  end

end
