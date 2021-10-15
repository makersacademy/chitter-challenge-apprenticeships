feature 'Add a new peep' do
  scenario 'To post a peep so to update people of my status' do
    visit('/peeps/new')
    fill_in('message', with 'new message 1')
    click_button('Submit')

    expect(page).to have 'new message 1'
  end
end