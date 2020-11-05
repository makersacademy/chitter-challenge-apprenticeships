feature 'Webpage displays content correctly' do
  scenario 'index displays title of Peeps' do
    visit '/'
    expect(page).to have_content("Peeps:")
  end
end
