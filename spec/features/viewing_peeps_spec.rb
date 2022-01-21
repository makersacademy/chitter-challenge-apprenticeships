feature 'Viewing peeps' do
  scenario 'A user can see bookmarks' do
    visit ('/peeps')

    expect(page).to have_content 'This is my first peep!'
    expect(page).to have_content 'This is my second peep!'
    expect(page).to have_content 'This is my third peep!'

  end
end