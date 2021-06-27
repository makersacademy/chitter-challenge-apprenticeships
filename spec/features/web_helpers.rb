require 'time'
require_relative '../../lib/peep'
require_relative '../../lib/user'

# def add_peep(username:, message:, date)
#   Peep.add(username: username, message: message, date)
# end

def add_user(username, password)
  User.add(username: username, password: password)
end

def add_peep(username="test", message)
  Peep.add(username: username, message: message)
end

def add_user_add_peep(username, password, message)
  user = User.add(username: username, password: password)
  Peep.add(username: user.username, message: message)
end

def register_user(username, password)
  visit('/peeps')
  click_link('Register')
  fill_in(:username, with: username)
  fill_in(:password, with: password)
  click_button('Register')
end

def log_in_user(username, password)
  visit('/peeps')
  click_link('Login')
  fill_in(:username, with: username)
  fill_in(:password, with: password)
  click_button('Login')
end

def log_out_user
  visit('/peeps')
  click_button('logout')
end

def register_and_log_in(username: , password: )
  register_user(username, password)
  log_out_user
  log_in_user(username, password)
end

def post_peep(message: )
  visit('/peeps')
  click_button('Peep!')
  fill_in(:message, with: message)
  click_button('Peep!')
end
