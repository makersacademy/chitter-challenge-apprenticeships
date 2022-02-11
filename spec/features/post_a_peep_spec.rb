feature 'Post a Peep' do
  scenario 'A user can post a peep to the database' do
    visit('/chitter/new')
    fill_in('message', with: 'Yay, it is Friday!')
    click_button('Post')

    expect(page).to have_content 'Yay, it is Friday!'
  end
end
