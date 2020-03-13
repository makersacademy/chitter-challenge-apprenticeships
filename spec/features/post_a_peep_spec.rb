feature 'Post a new peep' do
  scenario 'Can post a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'This is a test peep')
    click_button('Submit')

    expect(page).to have_content 'This is a test peep'
  end
end
