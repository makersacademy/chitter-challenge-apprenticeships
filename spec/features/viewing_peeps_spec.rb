feature 'Viewing peeps' do
  scenario 'A user can view peeps' do
    visit ('/')
    expect(page).to have_content('First peep!')
    expect(page).to have_content('Another peep!')
    expect(page).to have_content('One more peep!')
  end
end
    