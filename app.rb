require 'sinatra/base'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/messageboard' do
    time = Time.now
    @username = "wallsrgreat"
    @date = time.strftime("%d/%m/%Y")
    @message = "OMG loving these bangers!"
    @Keywords = "#love, #sausages"
               
    erb :messageboard
  end

  get '/chatter' do
    erb :chatter
  end

  run! if app_file == $0
end
