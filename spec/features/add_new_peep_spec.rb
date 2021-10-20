feature 'Add a new peep' do
  scenario 'To post a peep so to update people of my status' do
    visit('/peeps/new')
    fill_in('name', with: 'Patrick')
    fill_in('message', with: 'new message 1')
    fill_in('date', with: '2021-10-17')
    click_button('Submit')

    expect(page).to have_content 'Patrick'
    expect(page).to have_content 'new message 1'
    expect(page).to have_content '2021-10-17'
  end
end