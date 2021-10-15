feature 'Viewing index page' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Test page"
  end
end
