feature 'Post a new peep' do
  scenario 'Can post a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'This is a test peep')
    fill_in('author', with: 'Jordan')
    click_button('Submit')

    expect(page).to have_link('Jordan', href: 'This is a test peep')
  end
end
