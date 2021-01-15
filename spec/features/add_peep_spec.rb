feature 'Add a new peep' do
  scenario 'A user can post a message to Chitter' do
    visit('peeps/new')
    fill_in('peep', with: 'This is my first message!')
    click_button 'Submit'
    expect(page).to have_content 'This is my first message!'
  end
end
