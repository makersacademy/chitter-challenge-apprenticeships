feature 'authentication' do
  let!(:user) { User.create(email: 'test@example.com', password: 'password987') }

  scenario 'a user can sign in' do
    visit('/')
    fill_in(:email, with: user.email)
    fill_in(:password, with: 'password987')
    click_button('Sign in')

    expect(page).to have_current_path('/')
    expect(page).to have_content 'Welcome to Chitter, sign in below or Sign up here'
  end

  scenario 'a user sees an error if they get their email wrong' do
    visit('/')
    fill_in(:email, with: 'green@hotmail.com')
    fill_in(:password, with: 'password987')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
  end

  scenario 'a user sees an error if they get their password wrong' do
    visit('/')
    fill_in(:email, with: user.email)
    fill_in(:password, with: 'wrongpassword')
    click_button('Sign in')

    expect(page).not_to have_content 'Welcome, test@example.com'
  end
end
