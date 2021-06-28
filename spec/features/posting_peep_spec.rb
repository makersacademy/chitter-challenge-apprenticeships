feature 'Posting a peep' do
  scenario 'User can post and view their peep' do
    visit('/')
    fill_in('peep', with: 'Hello World!')
    expect(page).to have_content('Hello World!')
  end
end