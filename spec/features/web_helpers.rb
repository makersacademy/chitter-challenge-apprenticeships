require 'time'
require_relative '../../lib/peep'
require_relative '../../lib/user'

# def add_peep(username:, message:, date)
#   Peep.add(username: username, message: message, date)
# end

def add_user(username, password)
  User.add(username: username, password: password)
end

def add_peep(message)
  Peep.add(username: "test", message: message)
end

def add_user_add_peep(username, password, message)
  user = User.add(username: username, password: password)
  Peep.add(username: user.username, message: message)
end

def register_user(username, password)
  visit('/')
  click_link('Register')
  fill_in(:username, with: username)
  fill_in(:password, with: password)
  click_button('Register')
end
