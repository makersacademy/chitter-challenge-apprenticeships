feature 'Viewing peeps' do
  scenario 'User wants to see all peeps' do
    visit('/')
    save_and_open_page
    expect(page).to have_content('Chitter')
  end
end