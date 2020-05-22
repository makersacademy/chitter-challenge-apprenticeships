require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/peeps' do
    @peeps = Chitter.all
    erb :"peeps/index"
  end

  get'/peeps/new' do
    erb :"peeps/post_message"
  end

  post '/peeps' do
    Chitter.post_message(message: params[:message])
    redirect '/peeps'
  end

  run! if app_file == $0
end
