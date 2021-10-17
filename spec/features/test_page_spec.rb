feature 'Viewing test page' do
  scenario 'visiting the test page' do
    visit('/test')
    expect(page).to have_content "Test page"
  end
end

feature 'viewing chitter page' do
  scenario 'viewing all posted peeps in browser' do
    visit ('/chitter')
    expect(page).to have_content "Chitter"
  end
end
