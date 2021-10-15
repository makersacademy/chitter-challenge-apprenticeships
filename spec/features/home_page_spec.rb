feature 'Viewing home page' do
  scenario 'visiting the home page to view peeps' do
    visit('/')
    expect(page).to have_content "This is a peep!"
  end
end
