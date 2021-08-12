feature 'Add a new message' do
  scenario 'User can add a new message to chitter' do 
    visit ('/messages/new')
    fill_in('message', with: 'new message')
    click_button('Submit')

    expect(page).to have_content 'new message'
  end
end 