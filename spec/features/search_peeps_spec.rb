feature 'Search keywords' do
  scenario 'Search relevant peeps with keywords' do
    visit('/peeps/new')
    fill_in('name', with: 'Patrick')
    fill_in('message', with: 'new message 1')
    fill_in('date', with: '2021-10-17')
    click_button('Submit')

    visit('/peeps/new')
    fill_in('name', with: 'Joe')
    fill_in('message', with: 'new message 1')
    fill_in('date', with: '2021-10-17')
    click_button('Submit')

    fill_in('search', with: 'Patrick')
    click_button('Submit')
    expect(page).to have_content 'Patrick'
    expect(page).to_not have_content 'Joe'

    visit('/peeps')
    fill_in('search', with: 'Joe')
    click_button('Submit')
    expect(page).to have_content 'Joe'
    expect(page).to_not have_content 'Patrick'
  end
end