require 'sinatra'
require 'sinatra/reloader' if development?
require './lib/peepviewer'

class Chitter < Sinatra::Base
  get '/test' do
    'Test page'
  end

  get '/view_peeps' do
    @all_peeps = PeepViewer.all
    erb :view_peeps
  end

  run! if app_file == $0
end
