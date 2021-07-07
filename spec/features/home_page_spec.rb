feature 'Viewing home page' do
  scenario 'visiting the test page' do
    visit('/')
    expect(page).to have_content "Hello there"
  end

  scenario 'have a link to see all' do
    visit('/')
    expect(page).to have_link "View all"
  end
end