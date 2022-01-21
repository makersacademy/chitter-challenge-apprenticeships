feature 'view message' do
  scenario 'allows user to view all messages' do
    Peep.create(message: 'This is a peep!', date: '2021:02/01')
    visit '/peeps'
    expect(page).to have_content 'This is a peep!'
  end
end
