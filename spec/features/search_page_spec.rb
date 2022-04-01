require_relative '../../lib/models/user'
require_relative '../../lib/models/post'
require_relative '../../lib/models/databaseconnection'
require_relative '../setup_test_database'

feature 'Viewing Posts' do
  scenario 'visiting the test page' do
    u = User.create('test', 'secret')
    Post.create('Post 1', u.id)
    Post.create('Another Post', u.id)
    Post.create('This is a Post', u.id)
    Post.create('SQL is fun', u.id)

    visit('/search')
    expect(page).to have_content ("Search")
    expect(page).to have_content ("Post 1")

    fill_in('search', with: 'Another')
    click_on('Search')

    expect(page).to have_content ("Another Post")
    expect(page).to have_no_content ("Post 1")
    expect(page).to have_no_content ("This is a Post")
    expect(page).to have_no_content ("SQL is fun")

    fill_in('search', with: 'Post')
    click_on('Search')

    expect(page).to have_content ("Another Post")
    expect(page).to have_content ("Post 1")
    expect(page).to have_content ("This is a Post")
    expect(page).to have_no_content ("SQL is fun")
  end
end
