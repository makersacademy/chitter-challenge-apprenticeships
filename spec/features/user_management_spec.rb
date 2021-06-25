feature 'Chitter has users' do
  let(:username) { double(:username) }
  let(:password) { double(:password) }
  let(:connection) { PG.connect(dbname: 'chitter_test' )}

  scenario 'a user can register' do
    visit('/')
    click_link('Register')
    expect(current_path).to eq('/users/new')

    fill_in(:username, with: "testuser1")
    fill_in(:password, with: password)
    click_button('Register')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content "Welcome, testuser1"
  end

  scenario 'a user can log out' do
    visit('/')
    click_link('Register')
    expect(current_path).to eq('/users/new')

    fill_in(:username, with: "testuser1")
    fill_in(:password, with: password)
    click_button('Register')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content "Welcome, testuser1"

    click_button('logout')
    expect(current_path).to eq('/peeps')
    expect(page).to have_link('Register')
    expect(page).to have_link('Login')
  end

  scenario 'a user can log back in' do
    add_user(username, password)
    visit('/')
    click_link('Login')
    expect(current_path).to eq('/users/login')

    fill_in(:username, with: username)
    fill_in(:password, with: password)
    click_button('Login')

    expect(current_path).to eq('/peeps')
    expect(page).to have_content "Welcome, #{username}"
  end

 end
