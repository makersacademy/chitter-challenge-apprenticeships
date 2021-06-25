feature 'Posting a new peep' do
  scenario 'User can post a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'I have arrived!')
    click_button('Submit')

    expect(page).to have_content 'I have arrived!'
  end
end