feature 'viewing peeps' do
  scenario 'visiting the home page' do
    visit('/')
    expect(page).to have_content "Chitter peeps:"
  end
end