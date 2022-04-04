feature 'posting a new peep' do
  scenario 'A user can post a peep to chitter' do
    visit('/new_peep')
    fill_in('message', with: 'Today was a great day')
    click_button('Post')

    expect(page).to have_content("Today was a great day")
  end
end
