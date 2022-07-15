feature 'View all peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Check out the lastest Peeps!"
  end
end
