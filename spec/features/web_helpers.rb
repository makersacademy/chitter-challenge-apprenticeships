require 'time'
require_relative '../../lib/peep'
require_relative '../../lib/user'

# def add_peep(username:, message:, date)
#   Peep.add(username: username, message: message, date)
# end

def add_user(username, password)
  User.add(username: username, password: password)
end
