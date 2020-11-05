feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/')
    expect(page).to have_content "This is message 1"
    expect(page).to have_content "This is message 2"
    expect(page).to have_content "This is message 3"
  end
end
