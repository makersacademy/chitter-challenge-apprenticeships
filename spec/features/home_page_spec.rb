feature 'Viewing home page' do
  scenario 'Visiting the home page' do
    visit('/')
    expect(page).to have_content "Sign in"
  end
end
