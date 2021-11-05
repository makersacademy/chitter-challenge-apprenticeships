feature 'Viewing home page' do
  scenario 'check home page for message' do
    visit('/home')
    expect(page).to have_content"Sun is out!"
  end
end
