feature 'Signup' do
  scenario 'sign up new user' do
    signup
    expect(page).to have_content 'Send a Peep:'
  end

  scenario 'check new user is saved to database' do
    signup
    expect(User.all.last.username).to eq 'Foo'
  end
end