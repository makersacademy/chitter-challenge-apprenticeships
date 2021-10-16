require 'users'

feature 'Viewing messages' do
  scenario 'A user can see messages' do
    add_row_to_test_database
    add_user
    login_user
    visit('/messages')
    expect(page).to have_content "This is a peep!"
  end

  scenario 'A user can see several messages' do
    add_row_to_test_database
    add_user
    login_user
    Database.add_message(text: 'This is a test!')
    visit('/messages')
    expect(page).to have_content "This is a peep!"
    expect(page).to have_content "This is a test!"
  end
end

feature 'add new message' do
  scenario 'using form' do
    add_user
    login_user
    visit('/messages/new')
    fill_in :message, with: 'This is a peep!'
    click_button 'Submit'
    expect(page).to have_current_path('/messages')
    expect(page).to have_content "This is a peep!"
  end
end

feature 'authentication' do
  scenario 'a user can sign in' do
    add_user
    visit '/'
    fill_in(:username, with: 'Bob')
    fill_in(:password, with: 'pass')
    click_button('Submit')

    expect(page).to have_content 'Welcome Bob'
  end

  scenario 'makes user retry if failed' do
    visit '/'
    fill_in(:username, with: 'Bob')
    fill_in(:password, with: 'pass')
    click_button('Submit')

    expect(page).to have_current_path("/")
  end

  scenario 'check_logged_in fails' do
    visit('messages/new')
    expect(page).to have_current_path("/")
  end
end

feature 'create new user' do
  it 'fails if username exists' do
    add_user
    visit '/login/new'
    fill_in(:username, with: 'Bob')
    fill_in(:password, with: 'pass')
    click_button('Submit')

    expect(page).to have_current_path("/login/new")
  end

  it 'creats new user' do
    visit '/login/new'
    fill_in(:username, with: 'Bob')
    fill_in(:password, with: 'pass')
    click_button('Submit')

    expect(page).to have_current_path("/messages")
  end
end