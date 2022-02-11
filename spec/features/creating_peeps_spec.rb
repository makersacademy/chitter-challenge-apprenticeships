# in spec/features/creating_bookmarks_spec.rb

feature 'Adding a new peep' do
  scenario 'A user can add a peep to Chitter' do
    visit('/peeps/new')
    fill_in('message', with: 'Hi Chitface')
    click_button('Submit')

    expect(page).to have_content 'Hi Chitface'
  end
end