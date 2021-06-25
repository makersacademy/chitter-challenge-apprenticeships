feature 'Chitter has users' do
  let(:password) { double(:password) }

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

 end
