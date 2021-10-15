feature 'Header' do
  scenario 'Displays website name and navigation bar on all pages' do
    visit('/peeps')
    expect(page).to have_content('Chitter')
    expect(page).to have_link('Peeps')
    expect(page).to have_link('Create A Peep')
  end
end
