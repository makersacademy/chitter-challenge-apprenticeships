feature 'Viewing peeps' do
  scenario 'A user can view peeps in their browser' do
    visit('/newsfeed')

    expect(page).to have_content('This is a peep!')
  end
end
