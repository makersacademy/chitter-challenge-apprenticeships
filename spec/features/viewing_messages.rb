feature 'viewing messages(peeps)' do
  scenario 'A user can see messages(peeps)' do
    Peep.create(message: 'This is a peep!', post_date: '2021-01-02')
    Peep.create(message: 'Happy Thursday everyone', post_date: '2020-07-11')
    Peep.create(message: 'What a lovely day!', post_date: '2020-12-25')

    visit('/peeps')

    expect(page).to have_field('message', with: 'This is a peep!')
    expect(page).to have_field('post_date', with: '2021-01-02')
    expect(page).to have_content 'Happy Thursday everyone'
    expect(page).to have_content 'What a lovely day!'
    expect(page).to have_css("img[src*='friends.jpg']")
  end
end
