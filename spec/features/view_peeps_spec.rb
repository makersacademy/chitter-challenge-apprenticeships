feature 'View all peeps' do
  scenario 'A user can see all peeps in browser' do
    visit('/peeps')

    expect(page).to have_content "This is message 1."
    expect(page).to have_content "This is message 2."
    expect(page).to have_content "This is message 3."
  end
end