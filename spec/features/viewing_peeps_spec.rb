feature 'Viewing Peeps' do
  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Chitter: Latest Peeps"
  end
end
