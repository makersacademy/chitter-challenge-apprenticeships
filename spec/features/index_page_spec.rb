require_relative '../../lib/models/user'
require_relative '../../lib/models/post'
require_relative '../../lib/models/databaseconnection'
require_relative '../setup_test_database'

feature 'Viewing Posts' do
  scenario 'visiting the test page' do
    u = User.create('test', 'secret')
    Post.create('Post 1', u.id)
    Post.create('Another Post', u.id)

    visit('/')
    expect(page).to have_content ("Post 1")
    expect(page).to have_content ("Another Post")
    expect(page).to have_content ("test")
  end
end
