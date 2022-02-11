require 'sinatra/base'
# require 'sinatra/reloader'

class Chitter < Sinatra::Base
  # configure :development do
  #   register Sinatra::Reloader
  # end

  get '/test' do
    'Test page'
  end

  get '/view_messages' do
    messages = ['This is a peep',
                'and another peep'
              ]
    messages.join
  end

  run! if app_file == $0
end
