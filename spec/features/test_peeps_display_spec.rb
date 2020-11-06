feature 'Viewing peeps page' do
  scenario 'visiting peeps page and viewing the peeps' do
    visit('/peeps')
    expect(page).to have_content "Chitter"
    expect(page).to have_content "This is a peep!"
  end
end
