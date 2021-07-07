feature 'Add Peeps' do
  scenario 'user can post a peep and then view it' do
    visit '/'
    click_link 'Post A Peep'
    fill_in :message, with: 'I like apple juice!'
    click_button 'Peep'
    expect(page).to have_content('I like apple juice!')
  end
end
