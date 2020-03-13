feature 'Filter peeps' do
  scenario 'Users can filter peeps' do
    visit('/')
    fill_in('filter', with: 'second')
    click_button('Filter')
    
    expect(page).not_to have_content 'This is a peep!'
  end
end
