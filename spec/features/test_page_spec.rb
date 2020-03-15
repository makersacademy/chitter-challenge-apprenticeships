feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/')
    expect(page).to have_content "Chitter World"
  end
end
