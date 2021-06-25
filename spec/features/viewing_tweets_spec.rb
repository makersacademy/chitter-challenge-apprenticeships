feature 'Viewing tweets' do
  scenario 'Seeing tweets on the timeline' do
    Tweets.create(user_id: 1, message: 'Hello')
    Tweets.create(user_id: 1, message: 'Hi!')

    visit('/tweets')

    expect(page).to have_content('Hello')
    expect(page).to have_content('Hi!')
  end
end