feature 'View all peeps' do
  scenario 'The user can view all peeps in the browser' do
    visit('/view_peeps')
    expect(page).to have_content('This is a peep!')
    expect(page).to have_content('Another peep!')
    expect(page).to have_content('And one more!')
  end
end
