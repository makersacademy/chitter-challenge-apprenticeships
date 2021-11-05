require 'sinatra/base'

class Chitter < Sinatra::Base

  get '/test' do
    'Test page'
  end

  get '/message_page' do 
    connection = PG.connect(dbname: 'chitter_test')
    @result = connection.exec('SELECT messages FROM peeps ;')
    erb :message_page
  end 

  run! if app_file == $0
end
