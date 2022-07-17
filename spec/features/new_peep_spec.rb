# in spec/features/creating_bookmarks_spec.rb

feature 'Post a new peep' do
  scenario 'A user can post a new peep to chitter' do
    visit('/new')
    fill_in('message', with: 'hey peeps. just a peep to say I am posting a new peep. so peep this!')
    click_button('post your peep')

    expect(page).to have_content 'hey peeps. just a peep to say I am posting a new peep. so peep this!'
  end
end