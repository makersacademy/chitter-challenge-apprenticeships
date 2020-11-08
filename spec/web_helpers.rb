def create_user
  User.create(username: 'Foo', password: 'bar')
end

def create_peep
  user = create_user
  Peep.create(message: 'First tweet', user_id: user.id)
end

def create_peeps
  user = create_user
  Peep.create(message: 'First tweet', user_id: user.id)
  Peep.create(message: 'Second tweet', user_id: user.id)
  Peep.create(message: 'Third tweet', user_id: user.id)
end

def login
  visit '/'
  fill_in 'username', with: 'Foo'
  fill_in 'password', with: 'bar'
  click_button 'Login'
end

def signup
  visit '/'
  click_link 'Sign up here'
  fill_in 'username', with: 'Foo'
  fill_in 'password', with: 'bar'
  click_button 'Sign Up'
end