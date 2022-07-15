feature 'adding a new message' do
  scenario 'a user can add a message to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Example peep')
    fill_in('date', with: '2022-07-15')
    click_button('Submit')

    expect(page).to have_content '2022-07-15: Example peep'
  end
end
