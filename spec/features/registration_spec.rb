feature 'registration' do
  scenario 'a user is able to sign up' do
    visit '/newuser'
    fill_in('email', with: 'test@example.com')
    fill_in('password', with: 'password1')
    click_button 'Submit'
    expect(current_path).to eq '/chitter'
    expect(page).to have_content 'Welcome to Chitter test@example.com'
  end
end 