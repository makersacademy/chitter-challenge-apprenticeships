feature 'Adding a peep to chitter' do
  scenario 'A user can post a new peep to chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'test peep')
    click_button('Post Peep')

    expect(page).to have_content 'test peep'
  end
end