feature 'Adding a new message(peep)' do
  scenario 'A user can post a message(peep) to chitter' do
    visit('/messages/new')
    fill_in('message', with: 'a new post')
    fill_in('date-posted', with: '2022-01-12T19:30')
    click_button('POST!')
    
    expect(page).to have_content 'a new post'
  end
end