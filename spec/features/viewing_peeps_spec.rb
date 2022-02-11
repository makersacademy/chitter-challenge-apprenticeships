feature 'Viewing peeps' do
  scenario 'A user can view peeps in their browser' do
    visit('/newsfeed')

    expect(page).to have_content('This is a peep!')
  end

  scenario 'A user can see the date a peep was posted' do
    visit('/newsfeed')

    expect(page).to have_content('2021-02-10')
  end
end
