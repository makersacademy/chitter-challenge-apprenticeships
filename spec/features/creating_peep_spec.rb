feature 'add message(peep)' do
  scenario 'a user can post a new peep' do
    visit('/peeps/new')
    fill_in('message', with: 'Posting a new peep')
    click_button('Submit')

    expect(page).to have_content 'Posting a new peep'
    page.find('#date-time', visible: true)

    expect(page).to have_css("img[src*='friends.jpg']")
  end
end
