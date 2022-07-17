require 'pg'

feature 'Viewing posts page' do
  scenario 'A user can see previous posts' do
    time_when_tested = "2022-07-15 19:05:11"
    Peeps.create(peep: 'This is my first post!', time: time_when_tested)
    visit('/posts')
    expect(page).to have_content "This is my first post!"
  end
end
