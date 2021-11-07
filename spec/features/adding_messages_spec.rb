feature 'Adding messages' do
  scenario 'A user can add a message' do
    visit('/messages/new')
    fill_in('message', with: 'This is a new peep!')
    click_button('Submit')  

    expect(page).to have_content "This is a new peep!"
  end
end