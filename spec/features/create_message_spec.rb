feature 'Add a new message' do
  scenario 'Add a new peep to chitter' do
    visit('/')
    click_button('Start a new Peep!')
    fill_in('message', with: "This is a new peep!!")
    click_button('Send Peep')
    expect(page).to have_content "This is a new peep!!"
 
  end
end