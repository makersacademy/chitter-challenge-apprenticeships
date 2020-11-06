require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/' do
    'Welcome to Peeps'
  end

  get '/peeps' do
    peeps = [
      'The weather is very gloomy',
      'Back in lockdown!',
      'Hope everyone is happy!'
    ]
  end

  run! if app_file == $0
end
