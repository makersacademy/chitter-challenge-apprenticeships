feature 'user can see all peeps on their feed' do
  scenario 'user visits homepage and sees peeps there' do
    DatabaseConnection.create(message: 'This is a peep!', name: 'Testguy3', timestamp: '19/02/2021 1533')
    visit('/')
    expect(page).to have_content 'This is a peep!'
  end
end
