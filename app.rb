#coding:utf-8

require "sinatra"
require "compass"
require "twitter"

get "/" do
  haml :index
end

get '/stylesheets/:name.css' do
 content_type 'text/css', :charset => 'utf-8'
 sass(:"stylesheets/#{params[:name]}", Compass.sass_engine_options )
end
