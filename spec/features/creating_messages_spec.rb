feature 'adding a new message' do
  scenario 'a user can add a message to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Example peep')
    click_button('Submit')

    expect(page).to have_content 'Example peep'
  end
end
