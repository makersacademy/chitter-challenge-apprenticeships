feature 'filter peeps by keyword' do
  scenario 'the user can filter peeps by keyword' do
    Peeps.create(peep: 'This is a peep!')
    Peeps.create(peep: 'This is another peep!')
    Peeps.create(peep: 'This is a third peep!')

    visit('/')
    fill_in('search', with: 'third')
    click_button('Search')
    expect(page).to have_content 'This is a third peep!'
    expect(page).to have_no_content 'This is a peep!'
    expect(page).to have_no_content 'This is another peep!'
  end
end
