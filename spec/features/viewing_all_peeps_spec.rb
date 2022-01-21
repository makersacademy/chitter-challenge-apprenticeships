feature 'Visiting the index page)' do
  scenario 'User visits the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Chitter!"
  end
end